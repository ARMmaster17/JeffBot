[![Build Status](https://travis-ci.org/ARMmaster17/JeffBot.svg?branch=master)](https://travis-ci.org/ARMmaster17/JeffBot)
[![Gratipay Team](https://img.shields.io/gratipay/team/JeffBot-AI.svg?maxAge=2592000?style=flat-square)](https://gratipay.com/JeffBot-AI/)

# JeffBot
(Yet another) comical and extensible chat bot.

## What is it?
JeffBot is just another chat bot...nothing to see here.

## Ok, seriously, what is it?
JeffBot is a markov/neural-network based machine learning experiment in the form of a chat bot.

## What do I need to run it locally?
You will need a copy of PostgreSQL, RabbitMQ, and two terminals. Simply edit the `development` portion of each file in the `config` directory. After that, run both `ruby ./frontend/main.rb` and `ruby ./backend/main.rb`. You may need to set the environment variable `RABBITMQ_BIGWIG_URL` to point to your RabbitMQ installation (for localhost, use `ampq:\\localhost`).

## What if I'm too lazy to run it locally?
We have an installation running on heroku. You can visit it by going to [https:\\jeffchatbot.herokuapp.com](https:\\jeffchatbot.herokuapp.com). There is also a [GroupMe group](https://groupme.com/join_group/21478794/zYbvId), and an upcoming Kik version coming soon.

## Can I help?
Sure! Just be sure to document your code and your PRs. Other than that, remember to keep it simple!

## What if I can't program?
~~We accept Gratipay donations~~. We also benefit from sharing the site with your friends. The more people that talk to JeffBot, the faster it learns!

## I keep getting **Application Error**
Right now, we are hosted on the free tier of Heroku, which mandates that apps can only run for 18 hours per day. Just wait a few hours and try again. ~~If you would like to donate so we can use a bigger server, use the Gratipay icon above (team currently pending approval)~~.
