# SlackButton

## Requirements

1. ruby (2.2.2)
2. bundler (1.0 or greater)
3. postgres (9.1.0 or greater)

## Installation

#### Clone this repository

    git clone git@github.com:vigetlabs/slack_button.git

#### Install Ruby gems

    gem install bundler
    bundle install

#### Install Postgres

Install [Postgres](http://www.postgresql.org/) if it's not already on your machine.
If you're on OSX, we recommend using homebrew:

    brew install postgres

#### Configure your database

    cp config/database.yml.example config/database.yml

Edit `config/database.yml` to match the configuration for your PostgreSQL instance.
Then, create and migrate the database

    bundle exec rake db:create db:migrate

#### Configure application secrets

    cp config/secrets.yml.example config/secrets.yml

Edit `config/secrets.yml` with the proper Slack API URL, which can be obtained from your Slack services integration settings. Don't forget to also update PARTICLE_API_KEY and PARTICLE_DEVICE_ID.

## Running the SlackButton App

    rails server

Check that the app is running properly by opening [http://localhost:3000](http://localhost:3000) in your browser.

## Deploying

Set up the heroku app like so:

    heroku create your-app-name

Then push up your app and run migrations:

    git push heroku master
    heroku run rake db:migrate
