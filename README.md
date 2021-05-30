## FlutterFlow Deployment Example

Heres a simple notes app that was built using Flutter Flow and Firebase. These instructions will take you though the steps of setting up your project for deployment to iOS or Andriod.

#### *Some Notes:*

1. This tutorial doesnt yet include instructions for deploying to web as I have yet to get it working without doing local code changes before deployment. I aim to write up separate instructions for this.
2. As of publishing this, I am still running into publishing issues due to the version dependencies iOS is set to so be aware auto signing won't currently work from my experience.

## Getting Started

First off you'll need to push or manually upload your FlutterFlow application to GitHub (or for the purposes of this, fork this repo)

You have two options for building, I recommend using Code Magic *CI/CD* or alternatively you can build and run locally.


# Code Magic *(or other CI/CD)*

#### Getting Started

Signup to [CodeMagic](https://codemagic.io/signup) choosing the "Sign up with GitHub" option.

#### Add your app in the CI/CD

Select "Add your first app", **Connect to repository using other if you are using this example** *(If you are using your own private repository select connect to GitHub and choose your repository from the drop down.)*

#### Setting up the build workflow

Make sure that only Andriod and iOS are selected for your *"Build for platforms"*. 

Click on the **Plus** between *"Test"* and *"Build"* and paste the following into the *"Pre-build script"*

```
#!/bin/bash
flutter packages pub run build_runner build --delete-conflicting-outputs
```

Click on *"Save Changes"*

Now you can *"Start new build"*! This will take around 10 mins and at the end you will have an andriod APK and ios App file, inorder to run these apps on your device you will need to setup Andriod and iOS code signing and publishing:

#### Code Signing

[Setting up iOS code signing with Code Magic](https://docs.codemagic.io/code-signing/ios-code-signing/) *(I recommend setting up auto code signing to automate this process)*

[Setting up Andriod code signing with Code Magic](https://docs.codemagic.io/code-signing/android-code-signing/)

**I have to complete this step of the process for publishing**


# Working Locally *(Works both Mac and Windows)*

#### Getting Started

Clone your github repository locally or download the apps .zip from FireFlow
