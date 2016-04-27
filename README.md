[![Build Status](https://travis-ci.org/ARMmaster17/JeffBot.svg?branch=master)](https://travis-ci.org/ARMmaster17/JeffBot)
[![Gratipay Team](https://img.shields.io/gratipay/team/JeffBot-AI.svg?maxAge=2592000?style=flat-square)](https://gratipay.com/JeffBot-AI/)

# JeffBot
(Yet another) comical and extensible chat bot.

## What is it?
JeffBot is just another chat bot...nothing to see here.

## Ok, seriously, what is it?
JeffBot is a markov/neural-network based machine learning experiment in the form of a chat bot.

## What is the project status?
We are still in the early stages of development. JeffBot was originally supposed to be a fun weekend project, but due to the request of multiple developers, it has been published here on GitHub for all to see.

## Can I help?
Sure! Just be sure to document your code and your PRs. You are responsible for testing your code before submitting. Other than that, remember to keep it simple!

### Migrations
We use the [standalone-migrations](https://github.com/thuss/standalone-migrations) gem. You can add migrations by running:
```bash
$ rake db:new_migration name=add_other_field_to_entries
```
You can then edit the migration as normal:
```ruby
class AddOtherFieldToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :other_field, :string
  end
end
```

## What if I can't program?
~~We accept Gratipay donations~~. We also benefit from sharing the site with your friends. The more people that talk to JeffBot, the faster it learns!

## How does it work?
This is the backend process. This is meerly a RabbitMQ subscriber & it will call the correct method based on the queue the message was received on.

## How can I talk to it?
You can use any one of the fron end applications!

[JeffBot Slack](https://github.com/FreekingDean/JeffBot-Slack)

## Got more questions?
Checkout our [FAQ page](https://github.com/ARMmaster17/JeffBot/wiki/FAQ) for answers!
