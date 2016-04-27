require_relative 'markov'
require_relative 'lexicon'

class Botsolver
    def self.go(arg)
        query = Lexicon.clean(arg)
        return Markov.go(query)
    end
end
