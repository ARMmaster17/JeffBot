#!/bin/bash
echo 'Creating test database...'
psql -c 'create database travis_ci_test;' -U postgres
rake db:migrate
echo 'Done!'