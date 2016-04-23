#!/usr/bin/env ruby
require "bunny"
require_relative "lib/botsolver"

conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
conn.start

ch   = conn.create_channel

class JeffServer

  def initialize(ch)
    @ch = ch
  end

  def start(queue_name)
    @q = @ch.queue(queue_name)
    @x = @ch.default_exchange

    @q.subscribe(:block => true) do |delivery_info, properties, payload|
      r = Botsolver.go(payload)
      @x.publish(r, :routing_key => properties.reply_to, :correlation_id => properties.correlation_id)
    end
  end
end

begin
  server = JeffServer.new(ch)
  puts "A new backend worker is now online."
  server.start("jeff_queue")
rescue Interrupt => _
  ch.close
  conn.close
end