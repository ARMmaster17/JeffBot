require_relative 'ngram'
require_relative 'lexicon'
require_relative 'formulator'

module Markov
    def go(query)
        grams = Ngram.bigram(query)
        puts grams
        return "TESTING MODE...DO NOT RESPOND"
        Learn.train_array(grams)
        subject = Lexicon.get_subject(query)
        return Formulator.create_sentence_random(subject)
    end
end