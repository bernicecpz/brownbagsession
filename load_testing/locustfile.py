from locust import HttpLocust, TaskSet, task, constant, constant_pacing
from locust.contrib.fasthttp import FastHttpUser
import random, string, json
from testData import quoteList

wait_time = 1
target_host = 'http://localhost:3000'


class TheTaskSet(TaskSet):
    def on_start(self):
        self.headers = {}

    @task(50)
    def get_quotes(self):
        self.client.get('/', headers=self.headers, verify=False, name='Get quotes')

    @task(50)
    def post_quote(self):
        quoteList_index = random.randint(0, len(quoteList) - 1)
        getQuote = quoteList[quoteList_index]
        data = {
            "author": getQuote['author'],
            "quote": getQuote['quote']
        }
        with self.client.post(
            '/quotes',
            headers=self.headers,
            json=data,
            name='Create new quote',
            verify=False,
            catch_response=True
        ) as result:
            if result.status_code == 200:
                assert result is not None, '{"msg":"Quote by {} has been created successfully"}'.format(getQuote['author'])
                result.success()            


class TheUser(FastHttpUser):
    tasks = [TheTaskSet]
    wait_time = constant_pacing(wait_time)
    host = target_host