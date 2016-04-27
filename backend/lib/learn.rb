require 'sinatra/activerecord'
require_relative '../models/entries'

module Learn
    def Learn.train_array(inputs)
        inputs.each do |input|
            Learn.train(input)
        end
    end
    def Learn.train(input)
        learn_data = Entries.find_by(word: input[0], nword: input[1], definition: input[2])
        if learn_data.nil?
            if Entries.count < 9900
                learn_data = Entries.create(id: Entries.count, word: input[0], nword: input[1], definition: input[2], count: 1)
                learn_data.save
            end
        else
            learn_data.count = learn_data.count + 1
            learn_data.save
        end
    end
end