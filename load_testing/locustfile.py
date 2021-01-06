from locust import HttpUser, TaskSet, task, constant, constant_pacing
from locust.contrib.fasthttp import FastHttpLocust
import random
import string

wait_time = 1
target_host = 'http://localhost:4567'


class TheTaskSet(TaskSet):
    def on_start(self):
        self.headers = {}