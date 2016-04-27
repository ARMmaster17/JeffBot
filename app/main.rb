require "bunny"
require_relative "../config/environments"
require_relative "lib/botsolver"
require_relative "lib/jeffserver"

conn = Bunny.new(ENV['RABBITMQ_BIGWIG_URL'])
conn.start
ch   = conn.create_channel
server = JeffServer.new(ch)
puts "A new backend worker is now online."
begin
  server.start("jeff_queue")
rescue StandardError => ex
  puts ex
  ch.close
  conn.close
end
