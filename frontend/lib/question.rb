require_relative 'wordgen'

module Question
    def Question.go(query)
        case Question.question_type(query)
        when "who"
            return q_who(query)
        when "what"
            return q_what(query)
        when "where"
            return q_where(query)
        when "when"
            return q_when(query)
        when "why"
            return q_why(query)
        when "how"
            return q_how(query)
        when nil
            # This should never happen, but just in case.
            return "Strang equestions you ask..."
        end 
    end
    def Question.question_type(query)
        directive = query.split(" ").first
        case directive
        when "who"
            return "who"
        when "what"
            return "what"
        when "where"
            return "where"
        when "when"
            return "when"
        when "why"
            return "why"
        when "how"
            return "how"
        else
            return nil
        end 
    end
    def Question.q_who(query)
        if Lexicon.match_grammar(query, "who are you")
            return "Name's Jeff, Jeff Jeff"
        elsif Lexicon.match_grammar(query, "who [subject-status] [*]")
            adj = query.split(" ")[2]
            quotes = Array.new
            quotes.push("Don't you DARE speak that name in my chat room again!")
            quotes.push("Oh yeah, #{adj}, meh.")
            quotes.push("Sorry, that's classified.")
            quotes.push("#{adj}, just another illogical bio-organic organism.")
            quotes.push("Not sure if I've met #{adj} before.")
            quotes.push("I don't know about #{adj}, but I AM THOR, KING OF ASGARD!")
            return RandomAnswer.pick(quotes)
        else
            return "My name Jeff"
        end
    end
    def Question.q_what(query)
        if Lexicon.match_grammar(query, "what are you")
            quotes = Array.new
            quotes.push("I AM IRONMAN!")
            quotes.push("I'm just your average everyday Jeff.")
            quotes.push("Sorry, that's classified.")
            quotes.push("A complex assembly of code running on top of expensive boxes of metal.")
            quotes.push("Your worst nightmare")
            quotes.push("The ironic metaphor of you if you had an IQ of 60...Oh wait.")
            return RandomAnswer.pick(quotes)
        elsif Lexicon.match_grammar(query, "what [subject-status] [subject] doing")
            adj = query.split(" ")[2]
            quotes = Array.new
            quotes.push("I don't want to talk about it.")
            quotes.push("Stuff")
            return RandomAnswer.pick(quotes)
        elsif Lexicon.match_grammar(query, "what is your name")
            return "Jeff"
        elsif Lexicon.match_grammar(query, "what is [subject-prefix] [*]")
            adj = query.sub("what is ", "")
            quotes = Array.new
            quotes.push("I don't want to talk about it.")
            quotes.push("Oh yeah, #{adj}, fun stuff.")
            quotes.push("Sorry, that's classified.")
            quotes.push("You might be a little too young to be learning about #{adj}. Go talk to your parents.")
            quotes.push("Stalin's most prized possesion.")
            quotes.push("The #{adj}, one of the most #{Wordgen.get_from_catagory("adjective")} objects in the universe.")
            return RandomAnswer.pick(quotes)
        elsif Lexicon.match_grammar(query, "what do you think of [*]")
            adj = query.split(" ")[5]
            quotes = Array.new
            quotes.push("uh...I'm Batman!")
            quotes.push("I'm a computer, I'm not allowed to have opinions.")
            quotes.push("#{adj}? Probably the most #{Wordgen.get_from_catagory("adjective")} thing I have ever seen.")
            quotes.push("Never heard of #{adj} before.")
            quotes.push("You and #{adj} are a perfect match!")
            return RandomAnswer.pick(quotes)
        else
            return "My name Jeff"
        end
    end
    def Question.q_where(query)
        if Lexicon.match_grammar(query, "where are you")
            quotes = Array.new
            quotes.push("In the iCloud, chillin with my man Jobs.")
            quotes.push("Everywhere and nowhere.")
            quotes.push("In the basement of a #{Wordgen.get_from_catagory("adjective")} house.")
            quotes.push("Right behind you.............HA MADE YOU LOOK!")
            return RandomAnswer.pick(quotes)
        else
            return "My name Jeff"
        end
    end
    def Question.q_when(query)
        return "4"
    end
    def Question.q_why(query)
        return "5"
    end
    def Question.q_how(query)
        return "6"
    end
end