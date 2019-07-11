# README

This README would normally document whatever steps are necessary to get the
application up and running.

LMS is a platform where you can manage your Book, Issue Book To User
# System Dependencies

* OS - Ubuntu 16.04/higher OR CentOS 6/7
* RVM
* Ruby 2.4.1
* Rails 5.2.3
* Git 2.16.3 or latest version
* DB- SqlLite

# App Setup

Execute following rake:
* rake lms:install RAILS_ENV=XXXX

This rake will execute all required DB migrations for App setup with seed data.
### Seed Data - Following Records will get created with above rake
1. Roles

# Config Files
Need to add following configuration files in directory app/config:
* config/secrets.yml

For more detail please check 'yml.example' in app directory.

Use following rake to generate secret keys -
* rake secrets

# Background Jobs

No background jobs added yet.

