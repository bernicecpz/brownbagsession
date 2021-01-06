# Brown Bag Session 2021
---
## Background
In this repository, we will be dabbling into the following areas:
1. Test Automation with Robot Framework
2. Load Testing with Locust
3. Accessibility
---

### Activity 1 - Test Automation with Robot Framework
The learning objective of this activity is to familiarize with Robot Framework and its keyword driven approach.

In this activity, we are going to try automating some steps that are commonly done manually. We will be using a test site (https://webscraper.io/test-sites/e-commerce) to try out the activity.

Let our starting point be at the Tablets section of the commerce test site. 

#### Exercise 1
Using the Keywords available in SeleniumLibrary, write the script under the keyword `Then I navigate to the first computer tablet`. Look at the GIF of the steps I would like you to try automate.

<img src="/img/activity1.gif" alt="website interaction" style="height:40%" />

> Tip! Try using the Chrome Extension, Robotcorder, if you are not sure where/how to start. 

#### Exercise 2
Now that you are familiar with some of the keywords in SeleniumLibrary. Let's try `Then I navigate to laptops page`

---

### Activity 2 - Load Testing with Locust
The learning objective of this activity is to familiarize with Locust and observe how load testing works in a small scale.

#### Setup
1. **Switching to Python virtual environment**
Locust has been installed in the Python virtual environment named `locustEnv`. Please activate the environment with the following command.
`source locustEnv/bin/activate`

2. **Run the sample Express project**
A sample project with basic CRUD REST API, written in Express and Node.js, is provided in this activity. Please run the following command to start the project.
`node app.js`

3. **Open another terminal to start Locust**
