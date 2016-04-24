require_relative 'markov'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        return Markov.go(query)
    end
end