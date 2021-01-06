# Brown Bag Session 2021
---
## Background
In this repository, we will be dabbling into the following areas:
1. Test Automation with Robot Framework
2. Load Testing with Locust
---

## Setup of Virtual Environment 
You can use Python virtual environment to isolate the Robot Framework related packages to avoid potential clashes in other Python packages and binaries for your other projects.

1. Create a Python virtual environment.
`python3 -m venv <virtual_env_name>`

2. Activate the python virtual environment.
`source `

---
### Activity 1 - Test Automation with Robot Framework
The learning objective of this activity is to familiarize with Robot Framework and its keyword driven approach.

In this activity, we are going to try automating some steps that are commonly done manually. We will be using a test site (https://webscraper.io/test-sites/e-commerce) to try out the activity.

Let our starting point be at the Tablets section of the commerce test site. 

#### Exercise 1
- Using the Keywords available in SeleniumLibrary, write the script under the keyword `Then I navigate to the first computer tablet`. 
- Take a look at the GIF for the steps to automate.

> **Tip!** 
> Try using the Chrome Extension, Robotcorder, if you are not sure where/how to start. 

<img src="/img/activity1.gif" alt="website interaction" style="height:40%;" />

#### Exercise 2
- Now that you are familiar with some of the keywords in SeleniumLibrary. Let's try `Then I navigate to laptops page`

#### Test Execution 

##### MacOS/Linux
- You can execute the script with the command `robot Activity1.robot`. 
- If you would like to utilize the tags to run a specific test case, you can use either `-i` to include test cases with specific tags. E.g. `robot -i run Activity1.robot` which means only run test cases that have been tagged with 'run'.


#### Optional Exercise: Mobile testing
- The resources provided under `/native` includes a demo APK file and sample script from pCloudy's sample projects. 
- If you have Android Studio and a local Appium Server installed. You can try running it locally on your computer. 
- You can alternatively try the free trial on pCloudy's public device farm (https://www.pcloudy.com).

---

### Activity 2 - Load Testing with Locust
The learning objective of this activity is to familiarize with Locust and observe how load testing works in a small scale.

#### Setup
1. **Install NPM packages for the sample Express project and Locust**
```shell
cd load_testing
npm install
pip install locust
```

2. **Run the sample Express project**
 - A sample project with GET and POST request API, is provided in this activity. Please run the following command to start the project.
`node server.js` 
 - The database is [Nedb](https://github.com/louischatriot/nedb), using the persistent datastore  with automatic loading method.


3. **Open another terminal to start Locust**
- You will need to open 2 terminals - one for the master node and another for the worker node
- By default, the locust test script filename is locustfile.py. If you have named it differently, you will need to specify the filename with the `-f` option.
```shell
# Master Node
locust --master 

# Worker Node
locust --worker --master-host=<IP address of Master Node>
```

4. **Access the Web UI**
- Open your browser and navigate to `http://localhost:8089`
- You can input the number of users you want to simulate and how fast the number of users grow
- Click `Start Swarming`

<img src="/img/loadtest.gif" alt="website interaction" style="height:40%;" />



5. **Interpretating the report**
You can refer to this article which is informative in explaining the report details
https://dev.to/jankaritech/performance-testing-with-locust-04-interpret-the-results-3hco

