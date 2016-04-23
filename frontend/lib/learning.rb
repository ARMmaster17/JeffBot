require 'sinatra/activerecord'
require_relative '../models/entries'

module Learning
    def Learning.learn(word, meaning)
        # Try to find existing entry first
        begin
            data = Entries.find_by(word: word)
            data.definition = meaning
            data.save
        rescue
            data = Entries.create(word: word, definition: meaning)
            data.save
        end
    end
    def Learning.recall(word)
        begin
            data = Entries.find_by(word: word)
            return "#{word} means #{data.definition}"
        rescue
            return "I don't know that word yet, want to teach me?"
        end
    end
end