require_relative "test_helper"
require "test/unit"
require 'rack/test'
require_relative '../frontend/main'

class TestVersion < Test::Unit::TestCase
    include Rack::Test::Methods
  
    # Initialize testing objects
    def app
        Sinatra::Application
    end
    # Test static pages
    def test_homepage
        get '/'
        assert last_response.ok?
    end
    def test_basic_name
        post "/api/v1/post", {:args => "what is your name"}
        assert last_response.ok?
        assert_equal 'Jeff', last_response.body
    end
    def test_ai_learn
        post "/api/v1/post", {:args => "from now on knowledge is power"}
        assert last_response.ok?
        assert last_response.body.include?("knowledge") and last_response.body.include?("power")
        post "/api/v1/post", {:args => "what is knowledge"}
        assert last_response.ok?
        assert last_response.body.include?("knowledge") and last_response.body.include?("power")
    end
end