require_relative 'lexicon'
require_relative 'randomanswer'

module Botsolver
    def Botsolver.go(arg)
        query = Lexicon.clean(arg)
        if query.eql?("what is your name")
            return "Jeff"
        elsif query.eql?("say something funny")
            quotes = Array.new
            quotes.push("Something funny")
            quotes.push("Your face")
            quotes.push("Why?")
            quotes.push("No")
            quotes.push("Death")
            quotes.push("Superman is the best!")
            quotes.push("SPOILER ALERT: You're gonna die in the next 100 years")
            return RandomAnswer.pick(quotes)
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
        elsif query.match(/^my name is .+?/)
            adj = query.sub("my name is ", "")
            quotes = Array.new
            quotes.push("Hi #{adj}")
            quotes.push("What kind of name is that?")
            quotes.push("Name's Jeff, Jeff Jeff")
            quotes.push("My real name is 'hwrk-088766893a', but you can call me Jeff")
            quotes.push("I AM THOR, KING OF ASGARD!")
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
        elsif query.eql?("something funny") || query.eql?("something nice")
            return "Very funny"
        elsif query.match(/^are you a .+?/)
            adj = query.sub("are you a ", "")
            quotes = Array.new
            quotes.push("Yes I'm a #{adj}, How did you know?")
            quotes.push("Pretty sure that's what Hitler was")
            quotes.push("Nope")
            quotes.push("Who told you that?")
            quotes.push("Yes")
            quotes.push("I may or may not be a #{adj}, If I told you I would have to kill you")
            quotes.push("No")
            quotes.push("I'm not a #{adj}, I AM THOR, KING OF ASGARD!")
            return RandomAnswer.pick(quotes)
        elsif query.match(/^im a .+?/) or query.match(/^i am a .+?/)
            if query.match(/^im a .+?/)
                adj = query.sub("im a ", "")
            else
                adj = query.sub("i am a ", "")
            end
            quotes = Array.new
            quotes.push("Hi #{adj}, I'm Jeff")
            quotes.push("Pretty sure that's what Hitler was")
            quotes.push("Cool")
            quotes.push("Sure you are")
            quotes.push("I'm a robot, checkmate")
            quotes.push("No you aren't")
            quotes.push("Nu uh!")
            quotes.push("I AM IRONMAN!")
            return RandomAnswer.pick(quotes)
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