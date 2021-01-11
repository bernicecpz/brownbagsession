# Brown Bag Session 2021
---
## Background
In this repository, we will be dabbling into the following areas:
1. Test Automation with Robot Framework
2. Load Testing with Locust
---

## Prerequisites
- For Windows, you will need to enable the `Windows Subsystem for Linux` (requires reboot to take effect) and do additional setup. 
- Please refer to this article for guided walkthrough with images - https://www.ssl.com/how-to/enable-linux-subsystem-install-ubuntu-windows-10

- If time permits, you can setup a Linux VM (e.g. Ubuntu or any preferred Linux OS)

**If you prefer not to do any additional setup, you can use Repl.it, a browser based IDE with terminal (console and shell).**
- The instructions below will be based on using Repl.it.
- A brief testing reveals that Repl is not able to meet the needs for load testing and mobile testing. 
- If you have the terminal setup, please use the instructions in `README.md`

---
## Setup
- Go to this Repl project:  https://repl.it/@bernicecpz/RobotFramework
- Fork this project

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
*The term directory and folder will be used interactively here*.
- Click on the `shell` tag to access the terminal.
- Check your present working directory with the command `ls` to list the files and folders
- If you are not in the right directory, 
- You can execute the script with the command `robot Activity1.robot`. 
- If you would like to utilize the tags to run a specific test case, you can use either `-i` to include test cases with specific tags. E.g. `robot -i run Activity1.robot` which means only run test cases that have been tagged with 'run'.


#### Optional Exercise: Mobile testing (Not workable on Repl.it)
> I have attempted to install appium, however we do not have the permission to install anything beyond typical package manager.
- The resources provided under `/native` includes a demo APK file and sample script from pCloudy's sample projects. 
- If you have Android Studio and a local Appium Server installed. You can try running it locally on your computer. 
- You can alternatively try the free trial on pCloudy's public device farm (https://www.pcloudy.com).

---

### Activity 2 - Load Testing with Locust (Not workable on Repl.it)
The learning objective of this activity is to familiarize with Locust and observe how load testing works in a small scale.

> As the distributed mode requires multiple terminal windows, the Repl.it doesn't allow opening of more than 1 shell.


