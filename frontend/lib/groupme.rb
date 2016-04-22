require 'rest-client'
require 'json'

module GroupMe
    def GroupMe.send(inbound_sender, payload)
        GroupMe.broadcast("@" + inbound_sender + ": " + payload)
    end
    def GroupMe.broadcast(payload)
        if ENV["RACK_ENV"].equ?("production")
            resp = Hash.new
            resp["bot_id"] = ENV["GROUPME_BOT_ID"]
            resp["text"] = payload
            outbound_payload = resp.to_json
            result = RestClient.post('https://api.groupme.com/v3/bots/post', outbound_payload, :content_type => :json)
        else
            puts "GroupMe broadcast restrained. To use, re-run with RACK_ENV set to 'production'"
        end
    end
end