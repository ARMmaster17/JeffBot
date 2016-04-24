require_relative 'wordchain'

module Formulator
    def create_sentence(length, subject)
        result = ""
        previous_token = ""
        iterator = 0
        while (length > iterator)
            if iterator == 0
                result = subject + " "
                previous_token = subject
            else
                token = WordChain.next_word(previous_token)
                previous_token = token
                result = result + token + " "
            end
            iterator = iterator + 1
        end
        return result.strip
    end
    def create_sentence_random(subject)
        return Formulator.create_sentence(1 + rand(10), subject)
    end
end