require 'sinatra/activerecord'
require_relative '../models/entries'

module WordChain
    def next_word(previous_token)
        begin
            groups = Entries.where(word: previous_token).order(count: :desc)
            if(groups.length == 0)
                raise 'No matches found'
            else
                return groups.first.definition
            end
        rescue
            return Entries.all.order(count: :desc).limit(1).first.definition
        end
    end
end