# custard-loaf

Elm Singapore Meetup App #1

## Name

Is totally random for now - we will change it when we know what it is we are actually building.

## The App

https://custard-loaf.elmsg.surge.sh

## Join the team

Request access to this repo by adding a comment to [this issue](#1)

## Bootstrap

```
git clone git@github.com:elm-singapore/custard-loaf.git
cd custard-loaf
npm install
export PATH=$(pwd)/node_modules/.bin
# or set PATH=%cd%\node_modules\.bin;%PATH%
```

## Start dev server

```
elm-app start
```
Will open browser tab with app and hot reload when you edit source files.


## Run tests and validations

```
elm-app test
elm-analyse
```

## Workflow
1. create a local branch, `git checkout -b <branch name>
1. add tests and make your changes
1. validate that:
    * tests pass
    * code is formatted with elm-format
    * elm-analyse passes with no warnings
1. push your branch to our repo, `git push origin <branch name>`
1. raise a [Pull Request](https://github.com/elm-singapore/custard-loaf/pulls)
1. wait for travis to do it's stuff
1. squash-and-merge your PR
1. delete your branch
1. travis will test and deploy app to:
    * http://custard-loaf.elmsg.surge.sh

## Docs

* Create Elm App: [[using](https://github.com/halfzebra/create-elm-app/tree/master/template)] [[setup](https://github.com/halfzebra/create-elm-app)]
