require_relative 'lexicon'
require_relative 'randomanswer'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        if query.eql?("what is your name")
            return "Jeff"
        elsif query.match(/^say .+?/)
            return query.sub("say ", "")
        elsif query.match(/^what is a .+?/)
            return "I don't know, why are you asking me?"
        elsif query.match(/^am i .+?/)
            quotes = Array.new
            quotes.push("Yes")
            quotes.push("No")
            quotes.push("Absolutely")
            quotes.push("Negative")
            quotes.push("I don't know")
            quotes.push("Sure, whatever")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^are you .+?/)
            quotes = Array.new
            quotes.push("Yes")
            quotes.push("No")
            quotes.push("Absolutely")
            quotes.push("Negative")
            quotes.push("I don't know")
            quotes.push("Sure, whatever")
            quotes.push("I da best")
            quotes.push("I iz smrt")
            return RandomAnswer.pick(quotes)
        elsif query.eql?("something funny")
            return "Very funny"
        elsif query.match(/^im .+?/) or query.match(/^i am .+?/)
            if query.match(/^im .+?/)
                adj = query.sub("im ", "")
            else
                adj = query.sub("i am ", "")
            end
            quotes = Array.new
            quotes.push("Hi #{adj}, I'm Jeff")
            quotes.push("Reminds me of Hitler")
            quotes.push("What do you want me to do about it?")
            quotes.push("Sure, whatever")
            quotes.push("I'm da best")
            quotes.push("I'm the man, I'm the man, I'm the man, I'm the man, yes I am, yes I am, yes I am")
            quotes.push("I iz smrt")
            quotes.push("I'm Batman!")
            return RandomAnswer.pick(quotes)
        else
            return "My name Jeff"
        end
    end
end