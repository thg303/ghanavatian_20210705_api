#!/bin/bash

# takes care of running migration and seeding database
rails db:setup

puma -C config/puma.rb