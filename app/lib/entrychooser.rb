require 'sinatra/activerecord'
require_relative '../models/entries'
require_relative '../models/twoentries'

module EntryChooser
    def EntryChooser.get(level, query)
        if level > 3 or level < 2
            return ""
        end
        case level
        when 2
            return EntryChooser.pick_from_list(Entries.where(word: query.last).order(count: :desc))
        when 3
            return EntryChooser.pick_from_list(TwoEntries.where(word: query.last, nword: query.last(2).first).order(count: :desc))
        else
            return ""
        end
    end
    def EntryChooser.pick_from_list(options)
        if(options.length == 0)
            return ""
        else
            tokens = Array.new
            options.each do |item|
                for i in 0..item.count
                    tokens.push(item.definition)
                end
            end
            return tokens[rand(tokens.length)]
        end
    end
end