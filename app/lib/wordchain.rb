require 'sinatra/activerecord'
require_relative '../models/entries'

module WordChain
    def WordChain.next_word(previous_token)
        groups = Entries.where(word: previous_token).order(count: :desc)
        if(groups.length == 0)
            return ""
        else
            tokens = Array.new
            groups.each do |item|
                for i in 0..item.count
                    tokens.push(item.definition)
                end
            end
            return tokens[rand(tokens.length)]
        end
    end
end