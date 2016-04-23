require_relative 'frontend/main'
require 'sinatra/activerecord/rake'

task :test do
    system 'start ruby ./backend/main.rb'
    ruby "test/test.rb"
end