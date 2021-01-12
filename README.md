# Brown Bag Session 2021
---
## Background
In this repository, we will be dabbling into the following areas:
1. Test Automation with Robot Framework
2. Load Testing with Locust
---
> **Note** 
> - Windows in this case, is for users who have setup their Windows Linux subsystem.
> - Values in angle brackets (<>) are placeholders. Please replace with appropriate values that is relevant to your environment's context.

## Setup of Virtual Environment 
You can use Python virtual environment to isolate the Robot Framework related packages to avoid potential clashes in other Python packages and binaries for your other projects.

1. Create a Python virtual environment.
`python3 -m venv <virtual_env_name>`

2. Activate the python virtual environment.
`source <virtual_env_name>/bin/activate`

3. Install the required Python packages
`python3 -m pip install -r requirements.txt`

> For Windows user with Linux subsystem, please run with sudo

4. At the end of the activity, please enter the follow command to exit from the virtual environment
`deactivate`
---
##  Setup of chromedriver
**MacOS**
`brew cask install chromedriver`

**Windows**
- Install the latest stable version, chromedriver_win32.zip (https://chromedriver.storage.googleapis.com/index.html?path=87.0.4280.88/)
- After extracting from zip, set the chromerdriver.exe to your PATH
    - Search for **environment** > Click on `Edit the system environment variables`
    - Add a new environment variable for the chromedriver.exe
    - You must set the full path of the chromedriver.exe
        - To get full path, `Shift` + right click on the chromedriver.exe to `Copy as path`
    - **You must restart your computer for the PATH to take effect**
- In your terminal, `sudo apt-get install -y chromium-browser`
- To check for your Linux subsystem equivalent, enter `echo $PATH` 

In your Activity1.robot under `/robotframework_automation/web/test-suites`,
- Please include this under the Variables section
```python
*** Variables ***
${CHROMEPATH}    <linux_equivalent_path_for_chromedriver.exe>
``` 
- Please include the `executable_option` in the following line to specify to use the chromedriver 
```python
# Find the following line
Create Webdriver    Chrome    chrome_options=${chrome_options}    executable_path=${CHROMEPATH}
```


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

<img src="/img/activity1.gif" alt="website interaction" />

#### Exercise 2
- Now that you are familiar with some of the keywords in SeleniumLibrary. Let's try `Then I navigate to laptops page`

#### Test Execution 

##### MacOS/Linux
- You can execute the script with the command `robot Activity1.robot`. 
- If you would like to utilize the tags to run a specific test case, you can use either `-i` to include test cases with specific tags. E.g. `robot -i run Activity1.robot` which means only run test cases that have been tagged with 'run'.
    - Alternatively, if you are are the `/robotframework_automation` directory, you can run at the test-suite level with the command `robot -i run test-suites`


#### Optional Exercise: Mobile testing
- The resources provided under `/native` includes a demo APK file and sample script from pCloudy's sample projects. 
- If you have Android Studio and a local Appium Server installed, you can try running it locally on your computer. 
- You can alternatively try the free trial on pCloudy's public device farm (https://www.pcloudy.com).

<img src="/img/androidtesting.gif" alt="android mobile testing"/>
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

<img src="/img/loadtest.gif" alt="load testing"/>



5. **Interpretating the report**
You can refer to this article which is informative in explaining the report details
https://dev.to/jankaritech/performance-testing-with-locust-04-interpret-the-results-3hco

