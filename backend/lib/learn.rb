require 'sinatra/activerecord'
require_relative '../models/entries'

module Learn
    def train_array(inputs)
        inputs.each do |input|
            Learn.train(input)
        end
    end
    def train(input)
        begin
            learn_data = Entries.find_by(word: input[0], definition: input[1])
            learn_data.count = learn_data.count + 1
        rescue
            learn_data = Entries.create(id: Entries.count, word: input[0], definition: input[1], count: 1)
        end
    end
end