require 'sinatra/activerecord'
require_relative '../models/entries'

module Learn
    def Learn.train_array(inputs)
        i = 0
        while i < (inputs.length / 2)
            Learn.train(Array.new(inputs[i], inputs[i + 1]))
            i = i + 2
        end
    end
    def Learn.train(input)
        learn_data = Entries.find_by(word: input[0], definition: input[1])
        if learn_data.nil?
            learn_data = Entries.create(id: Entries.count, word: input[0], definition: input[1], count: 1)
            learn_data.save
        else
            learn_data.count = learn_data.count + 1
            learn_data.save
        end
    end
end