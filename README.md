# Adventures In Tech World

Mastery through adventuring with friends.

[![Coverage Status](https://coveralls.io/repos/github/Adventures-In/Tech-World/badge.svg?branch=dev)](https://coveralls.io/github/Adventures-In/Tech-World?branch=dev)
![CI](https://github.com/Adventures-In/Tech-World/workflows/CI/badge.svg)

# Setup 

1. clone the project into 'tech_world', or anything with lowercase and underscores (restriction of dart packages)
1. enable flutter web if not already done (see [Building a web application with Flutter - Flutter](https://flutter.dev/docs/get-started/web))

## Firebase config 
### (if you want to join as a collaborator)
1. join [the firebase project](https://console.firebase.google.com/project/adventures-in-tech-world)
1. setup [firebase cli](https://firebase.google.com/docs/cli), if not done already
1. get the missing credential files - run: `./get-credentials.sh`

### (if you don't want to join as a collaborator)
1. create a firebase project, see: [Add Firebase to your JavaScript project](https://firebase.google.com/docs/web/setup)
1. run `firebase init` and follow the prompts 
1. add firebase config to `index.html`
   1. see [Add Firebase to your JavaScript project > Add SDKs](https://firebase.google.com/docs/web/setup#add-sdks-initialize)
   1. use the "From the CDN" method for local debugging 

### Run the project
1. Generate missing built_value files 
   - `flutter pub run build_runner build --delete-conflicting-outputs`
     - or, if you want the code gen to rebuild on changes: 
   - `flutter pub run build_runner watch --delete-conflicting-outputs`
1. Run with the 'Main' launch configuration 

### Integration tests (WIP) 
1. install [redux-devtools-cli](https://github.com/reduxjs/redux-devtools/tree/master/packages/redux-devtools-cli)
   - `npm install -g redux-devtools-cli`
1. run redux devtools
   - `redux-devtools --open`
1. setup chrome driver 
   - [An introduction to integration testing > Flutter Web](https://flutter.dev/docs/cookbook/testing/integration/introduction#6b-web)
1. run chrome driver 
   - `~/utils/chromedriver --port=4444`
1. run the integration tests 
   - `flutter drive --target=test_driver/app.dart --browser-name=chrome --release -d chrome`

## State Diagrams 

### Auth Sequence 

![](https://docs.google.com/drawings/d/e/2PACX-1vR9GnJw-lPS7YUP-By-OmTua2vrPwW89MHf7YxWZssHgWAhIblWBg9mEwiZiiJx8YWbolNfRlYedHjM/pub?w=1242&h=984)

## Sections 
#### Profiles 

You can add info about what you're working on, including links to repos. Also some of the skills you have, the type of projects you want to work on and anything you need help with.

#### Topics 

You can select a set of topics you are interested in. 

#### Project Management 

You can indicate your current goals by selecting issues in your repos. 

## Editing the Wiki 

If you haven't yet, you'll need to initialize the submodule and update it:

```sh
git submodule init
git submodule update
```

# Common Commands 

```sh
remotedev --port 8000
flutter pub run build_runner build --delete-conflicting-outputs
flutter pub run build_runner watch --delete-conflicting-outputs
firebase deploy --only functions
firebase deploy --only hosting:adventures-in-tech-world
firebase deploy --only firestore:rules
~/utils/chromedriver --port=4444
flutter drive --target=test_driver/app.dart --browser-name=chrome --release -d chrome
```