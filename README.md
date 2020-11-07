# Adventures In Tech World

Mastery through adventuring with friends.

[![Coverage Status](https://coveralls.io/repos/github/Adventures-In/Tech-World/badge.svg?branch=dev)](https://coveralls.io/github/Adventures-In/Tech-World?branch=dev)
![CI](https://github.com/Adventures-In/Tech-World/workflows/CI/badge.svg)

### Get started 
- [Setup The Project](https://github.com/Adventures-In/Tech-World/wiki/Setup-The-Project)
- [Run the project](https://github.com/Adventures-In/Tech-World/wiki/Run-the-project)
- [Testing](https://github.com/Adventures-In/Tech-World/wiki/Testing)

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
flutter run -t lib/main_rdt.dart
```

Kill the process on port 8080 (ie. when `firebase emulators` wasn't properly terminated)
```
lsof -t -i tcp:8080 | xargs kill
```