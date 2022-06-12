# iOS Swift Example Code Test

### Introduction

Actually this project is **private** due to internal reasons. This project was made by @whitehatdevv for a technical test on OBS. You can find the instructions provided for the project here:

[See instructions](https://docs.google.com/document/d/1PVTJ8Zj8cMD0G0FJrVXpe6Jp5H-bGQjW/edit?usp=sharing&ouid=110145367989075710341&rtpof=true&sd=true "See instructions")

### How to start the project?

1. Clone the project with ``$ git clone <url:string>``
2. Move to the project folder and run `$ xed .` 
*AKA: You must have installed xcodetools `$ xcode-select --install`*
3. Select the simulator where you want to see the app.
4. Enjoy the full app :) 

### Fastlane

Fastlane has been installed inside project structure, it allow us to run test automatically using `scan` command, to start running all the test around the project run on your terminal:
``$ flastlane tests``

### Project structure

There are two targets on the project:
- UITesting -> This target has been used to test all UI components I have developed here. Ignore completely that.
- Atthelic App -> This target is the main one you must run to start the app.

Also, there are three custom SPM created inside the project folder:
- Networking: This module contains a fully functinal network layer made using Protocol oriented programming. 
- Services: It contains all the API calls thoughout Networking.
- AppUtils: It contains all UI components and enhacements needed to complete the project. Also there are a lot of extensions which allow us to customize the app. This module contains a third party library called `CDMarkdownKit` to show the Attlete Description using Markdown format.

### Project architecture

Project has been build using MVVM-C, it means we have some MVVM modules and some Coordinators to  manage navigation stuff. 
*AKA: Each coordinator uses a factory to create each module see `RootFactory`*
Once the app is being running you will enter inside `RootCoordinator` who will be responsible of main navigation stack. This app contains two coordinators:
- Root Cordinator: It is reponsible of creating the first Splash Module and navigate after that to the Main Coordinator. 
- Main Coordinator: It is responsible of managing the main flow of the app. 

Each module talks with the coordinator using a custom `Router-Wireframe`. Actually each module contains:
 - View -> Graphical representation of the module.
 - View Model -> It contains all the login around this module.
 - DataProvider -> It talks with the `Service` Module to ask for an API call.
 - Contracts+Utilities -> It basically contains all protocol (comunnication stuff) and some utilities for that module.

Also, you can see a `Domain` folder which contains all the`DOM` objects used around the application. It app has been build by Clean Architecture trying to make as layers as needed to avoid coupling and bring to the project the confidence we need to put it into production environment. 
Also, you can see several Dependency Injection, it has been made thoughtout `inits`.

### Contribution

This projects run by MIT license, any contribution can be made using Pull Requests.

### Doubts
If you have any doubt do not hestitate to contact me directly via emanuel.martinez@attlos.com
