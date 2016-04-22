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
post '/api/v1/post' do
    Botsolver.go(params[:arg])
end
post '/api/v1/extern/groupme' do
    request.body.rewind
    data = request.body.read
    puts data
    inbound_payload = JSON.parse(data)
    inbound_message = inbound_payload['text']
    inbound_sender = inbound_payload['name']
    if inbound_message.split(" ")[0].eql?(inbound_payload['@' + ENV["GROUPME_BOT_NAME"]])
        resp = Hash.new
        resp['bot_id'] = ENV['GROUPME_BOT_ID']
        resp['text'] = "@#{inbound_sender}: #{Botsolver.go(inbound_message)}"
        outbound_payload = resp.to_json
        result = RestClient.post('https://api.groupme.com/v3/bots/post', outbound_payload)
    end
end