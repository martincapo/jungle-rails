# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.

Features Implemented

* Sold Out Badge
* Admin Categories
* User Authentication
* Email Receipt
* Product Rating

Enhancement

* Order Details Page

Bug Fixed

* Missing Admin Security
* Checking Out with Empty Cart

# Goal of this project

* Become familiar with Ruby and the Rails framework
* Learn how to navigate an existing code-base
* Use existing code style and approach to implement new features in unfamiliar territory
* Apply previous learning tactics to research and become familiar with a new paradigm, language and framework
* A simulation of the real world where feature and bug-fix requests are listed instead of step-by-step instructions on how to implement a solution


## Screenshot

!["Screenshot description"](https://github.com/martincapo/jungle-rails/blob/master/docs/jungle-main.png)
!["Screenshot description"](https://github.com/martincapo/jungle-rails/blob/master/docs/jungle-product.png)
!["Screenshot description"](https://github.com/martincapo/jungle-rails/blob/master/docs/jungle-email.png)

## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
