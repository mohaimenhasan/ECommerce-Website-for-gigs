# ECE444-Home-Gig

[![Build Status](https://travis-ci.com/mohaimenhasan/ECE444-Home-Gig.svg?token=Jqs53LsBFVYpD28zocVZ&branch=master)](https://travis-ci.com/mohaimenhasan/ECE444-Home-Gig)

Ruby-on-Rails app project for ECE444 - Software Engineering. This app provides the oppurtunity of contract work for different gigs. For example,software development, copy-editing, graphic design, or the creation of marketing material that can often be done at home. The basic idea behind this service if to create a home gig service that connects those offering work with those seeking work done, and offer such subservices as billing and payments.


## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites

The following software with the specified versions, as mentioned below, need to be installed:
<li> Ruby </li>
<li> Rails </li>
<li> postgreSQL </li>
<li> Heroku </li>

### Software Installation Versions:

<b> Ruby: </b> 2.6.4 <br/>
<b> Rails: </b> 6.0.0 <br/>
<b> PSQL: </b> 12.0 <br/>


### Installing

A step by step series of examples that tell you how to get a development env running. Please run all the commands from app directory:

1. git clone the repository
```
git clone https://github.com/mohaimenhasan/ECE444-Home-Gig.git
```
2. Create an account on stripe and add your stripe keys into ENV (for testing and deployment)

```
GMAIL_USERNAME: <account for sending out emails>
GMAIL_PASSWORD: <gmail pass>
STRIPE_PUBLISHABLE_KEY: <from stripe wesbite>
STRIPE_SECRET_KEY: <from stripe website>
```
3. Add stripe api keys in to credentials by using the following commands

```
EDITOR=vim rails credentials:edit
stripe:
  development:
    publishable_key: '<from stripe website>'
    secret_key: '<from stripe website>'
```
4. Install all the gems
```
bundle install
```
5. Set Up Database
```
rails db:create
```
6. Migrate all the necessary schemas
```
rails db:migrate
```
7. Populate the db with some categories:
```
rails db:seed
```
8. Start the server:
```
rails s
```

## Running the tests

To run the automated test run the following from the app directory:

```
rails test test/
```

### Break down into end to end tests

Explain what these tests test and why

* Test for users

Users can not be created without a valid email

```
rails test test/models/user_test
```

## Deployment

To deploy it on heroku please sign in and request for access for the app: 
https://dashboard.heroku.com/apps/secure-ocean-69468

Live Demo available at: https://secure-ocean-69468.herokuapp.com/

## Built With

* [Ruby](https://www.ruby-lang.org/en/downloads/) - Language
* [Rails](https://guides.rubyonrails.org/getting_started.html) - Web Framework
* [PSQL](https://www.postgresql.org/download/) - Relational Database

## Authors

* **Mohaimen Khan** 
* **Jennifer Hu** 
* **Hongyi Yang** 
* **Muhammad Waseem Qadeer** 
* **Zihan Zhao** 

See also the list of [contributors](https://github.com/mohaimenhasan/ECE444-Home-Gig/contributors) who participated in this project.

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgements

* Kijiji
* Fiverr
