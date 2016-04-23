#!/usr/bin/env ruby
require "bunny"
require_relative "lib/botsolver"
require_relative "lib/jeffserver"

conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
conn.start
ch   = conn.create_channel
begin
  server = JeffServer.new(ch)
  puts "A new backend worker is now online."
  server.start("jeff_queue")
  while true
    #do stuff
  end
rescue Interrupt => _
  ch.close
  conn.close
rescue Exception => ex
  puts ex
end