module RandomAnswer
    def RandomAnswer.pick(quotes)
        choice = rand(quotes.length)
        return quotes[choice]
    end
end