# SehatQ_Assignment

## Description

sehatq_assignment is a repository for test procedure in SehatQ Company. sehatq_assignment is an API module for health care online booking. It's using **RubyOnRails** as its framework.

This branch is add social login, but it is still not stateless api. It only generate session in cookies, so I can't use it to access protected api endpoints.

## Architecture Diagram

## Owner

[SehatQ](https://www.sehatq.com) 

## Contact and On-Call Information

- [Rojali Budi Permadi](mailto:rojali.budi.permadi@gmail.com)

## Links

> Not available yet

## Onboarding and Development Guide

### Prequisites

1. Ruby 2.5.1 (using RVM is recommended)
2. MySQL
3. Yarn

### Setup

Please install/clone the [Prequisites](#prequisites) and make sure it works perfectly on your local machine.

After the [Prequisites](#prequisites) have been installed, please clone **SehatQ** project into your local machine.

### Installation

1. Clone

   ```
   git clone git@github.com:rbpermadi/sehatq_assignment.git
   cd sehatq_assignment
   ```

2. Create Gemset

   ```
   rvm 2.5.1@sehatq_assignment --create
   ```

3. Install Bundler

   ```
   gem install bundler
   ```

4. Install Gems

   ```
   bundle install
   ```

5. NPM Install

   ```
   npm install
   ```

6. Yarn Install

   ```
   yarn install
   ```

7. Copy `env`

   ```
   cp .env.sample .env
   ```
   Make a copy from [env.sample](env.sample), name it `.env` and make necessary change for your need.
   > _Important Note : **NEVER EVER** delete [env.sample](env.example) file from your local machine

8. Prepare Databases

   ```
   bundle exec rake db:create:all # this will create the database
   bundle exec rake db:migrate # this will generate tables
   bundle exec rake db:migrate RACK_ENV=test # this will generate tables on db test
   bundle exec rake db:seed # this will generate basic dummy data
   ```

### Running SehatQ

1. Run application and services

   ```
   # Make sure your MySQL are running
   rails server
   ```

2. Access it at `http://0.0.0.0:3000`

### Running SehatQ API Blueprint

1. Run application and services

   ```
   bin/yarn add aglio
   bin/yarn run aglio -i docs/api-blueprint.md  -o public/documentation.html
   ```

2. Access it at `http://0.0.0.0:3000/documentation.html`

### Running SehatQ Unit Test

1. Run the db test preparation

   ```
   bundle exec rake db:test:prepare
   ```

2. Run the unit test

   ```
   bundle exec rspec spec/
   ```

### Contributing

1. Make new branch with descriptive name about your change(s) and checkout to that branch

   ````
   git checkout -b branch_name
   ````


2. Commit and push your change to upstream

   ````
   git commit -m "message"
   git push [remote_name] [branch_name]
   ````

3. Open pull request in `Github`

4. Ask someone to review your code.

5. If your code is approved, the pull request can be merged.


## Request Flows, Endpoints

### Request Flow

See architecture diagram

### Endpoints

Blueprints: (http://0.0.0.0:3000/documentation.html)