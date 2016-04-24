require_relative 'lib/markov'
require_relative 'lib/lexicon'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        return Markov.go(query)
    end
end