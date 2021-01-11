# Prospect README

![](app/assets/images/crb_logo_prospect.png)

## Table of Contents
* [General Information](#general-information)
* [Technology](#technology)
* [Setup](#stepup)
* [Dependencies](#dependencies)
* [Tests](#tests)
* [Deployment](#deployment)
* [ToDo](#todo)

## General Information
This application was made for the Columbus Ruby Brigade in order to combine board member nominations and voting into a single platform.
This application is dark-mode friendly.

## Technology
This project was created with and reliant upon:
* Ruby 2.7.2
* Rails 6.1
* Materialize-Sass
* Material Design Icons
    - for icon names, reference MDI v. 4.1.95 docs
* JQuery

## Setup
* Install Ruby and Rails versions, if needed
```
# Clone repository
$ git clone
# Switch to the repository
$ cd 
# Install dependencies
$ bundle
# Create the database
$ rails db:migrate
# Seed with candidates, if desired
$ rails db:seed
# Start rails server
$ rails s
```
* If changes are made to the seed file for local testing purposes, drop the database first, then re-create it. The server will need to be re-started.

* Because this application is dark mode-friendly, you may want to adjust your rendering for testing purposes using Dev tools (Chrome: Rendering > Emulate CSS media feature prefers-color-scheme).

## Dependencies
* Must be integrated with Slack in order to successfully login.
* .env file must be included in order to set dates. The variables and date formatting as follows:
```
NOMINATIONS_START_DATE=2020-MM-DD
NOMINATIONS_END_DATE=2020-MM-DD
VOTING_START_DATE=2020-MM-DD
VOTING_END_DATE=2020-MM-DD
```
* Secret keys, client ID, etc. must be obtained from Slack via the Admin. panel.

## Tests
* Minitest (built into Rails)
* Mocha (primarily used to stub out .env dates and handle dates in testing more easily)
* `test/fixtures/`

* To run all tests
```
# Run tests
$ rails test
```
* Coverage report can be found in `.../coverage/index.html` after running the tests.

## Deployment
* CI will run first. 
* Automatic deployments enabled.
* To manually deploy to Heroku: Heroku `heroku  git:remote -a app-name-here`
* Make sure to run `heroku run rails db:migrate` to create the database.

## ToDo:
* Increase test coverage

![](app/assets/images/crb_prospect_scatter.png)