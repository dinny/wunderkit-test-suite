# Wunderkit Test Suite

This is a sample test app, using watir-webdriver to drive browsers for wunderkit test. It uses spinach to organize the tests rather than cucumber. It will use a separate class to contain specific test scripts. We can abstract the common functions and put it into a module.

For this test app, rvm and bundler will be used to manage ruby version and gems in use. Please make sure that they have already been installed on the system:

- rvm: http://beginrescueend.com/rvm/install/
- bundler: gem install bundler


## ENVIRONMENT SETUP

Before running the app, you have to install the required ruby version and gems. Navigate to the root directory(the same level as this README). Press "y" if rvm prompts to confirm if you trust that .rvmrc file. 

    dinny-macbook-air:dinny-projects dinny$ cd wunderkit-test-spinach/
    ==============================================================================
    = NOTICE                                                                     =
    ==============================================================================
    = RVM has encountered a new or modified .rvmrc file in the current directory =
    = This is a shell script and therefore may contain any shell commands.       =
    =                                                                            =
    = Examine the contents of this file carefully to be sure the contents are    =
    = safe before trusting it! ( Choose v[iew] below to view the contents )      =
    ==============================================================================
    Do you wish to trust this .rvmrc file? (/Users/dinny/Projects/dinny-projects/wunderkit-test-spinach/.rvmrc)
    y[es], n[o], v[iew], c[ancel]> yes

1. Install ruby-1.9.2-p318 if not installed: rvm install 1.9.2-p318
2. Install gems(DO NOT sudo it): bundle install


## RUN THE FEATURE TESTS

Commands to run the tests:

    $ git clone git@github.com:dinny/wunderkit-test-suite.git
    $ cd wunderkit-test-suite
    $ spinach

You can also use guard's built-in feature to run the corresponding feature tests immediately
after you save the test scripts. To do that, you need to first run "guard" in a terminal,
and once you saved the scripts, it will run the modified feature tests.


## TO-DOs

- Abstract command test steps into a module.
- Add a command line prompt or a config file to select the browser type.
- Support the HTML output to get the formatted output as a test report.
- More cases.


## FAQ

