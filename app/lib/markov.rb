require_relative 'ngram'
require_relative 'lexicon'
require_relative 'formulator'
require_relative 'learn'

module Markov
    def Markov.go(query)
        grams = Ngram.bigram(query)
        puts grams.inspect
        Learn.train_array(grams)
        subject = Lexicon.get_subject(query)
        return Formulator.create_sentence_random(subject)
    end
end