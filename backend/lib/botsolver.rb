require_relative 'markov'
require_relative 'lexicon'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        return Markov.go(query)
    end
end