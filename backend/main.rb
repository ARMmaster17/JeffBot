#!/usr/bin/env ruby
require "bunny"
require_relative "lib/botsolver"
require_relative "lib/jeffserver"

puts "1"
conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
conn.start
ch   = conn.create_channel
puts "2"
server = JeffServer.new(ch)
puts "A new backend worker is now online."
server.start("jeff_queue")
while true
  #do stuff
end
puts "3"
ch.close
conn.close