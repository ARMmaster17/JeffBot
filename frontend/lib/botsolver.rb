require_relative 'lexicon'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        if query.eql?("what is your name")
            return "Jeff"
        elsif query.match(/^say .+?/)
            return query.sub("say ", "")
        else
            return "My name Jeff"
        end
    end
end