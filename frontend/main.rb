#!/usr/bin/env ruby
require 'rubygems'
require 'sinatra'
require 'slim'
require 'rest-client'
require 'json'
require 'rack-flash'
require_relative 'lib/botsolver'

set :port, ENV['PORT'] || 8080
set :bind, ENV['IP'] || '0.0.0.0'

#enable :sessions
#use Rack::Flash

##
# Index page of site featuring chat window.
get '/' do
   slim :chathome 
end

##
# Simple API endpoint for getting response to query
get '/api/v1/post' do
    Botsolver.go(params[arg])
end