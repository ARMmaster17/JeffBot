require 'sinatra/activerecord'
require_relative '../models/entries'

module WordChain
    def next_word(previous_token)
        groups = Entries.where(word: previous_token).order(count: :desc)
        if(groups.length == 0)
            return Entries.all.order(count: :desc).limit(1).first.definition
        else
            return groups.first.definition
        end
    end
end