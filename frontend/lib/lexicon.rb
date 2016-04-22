require_relative "yamlapi"
require_relative "question"

module Lexicon
    def Lexicon.clean(str)
        result = ""
        Lexicon.get_tokens(str).each do |token|
            result = result + " " + token.gsub(/[^a-zA-Z]/, "")
        end
        return result.strip.downcase
    end
    def Lexicon.is_question(query)
        if Question.question_type(query).nil?
            return false
        else
            return true
        end
    end
    def Lexicon.match_grammar(query, test_case)
        if !Lexicon.has_equal_tokens(query, test_case)
            return false
        end
        data_file = Yamlapi.new("dictionary")
        i = 0
        q_tokens = Lexicon.get_tokens(query)
        t_tokens = Lexicon.get_tokens(test_case)
        while i < Lexicon.get_number_of_tokens(query)
            if t_tokens[i].eql?("[*]")
                # Do nothing, this is a wildcard
            elsif t_tokens[i].match(/^\[.+?\]/)
                test_case_mod = t_tokens[i].sub("[", "").sub("]", "")
                if !Lexicon.match_token(data_file, q_tokens[i], test_case_mod)
                    return false
                end
            else
                if !q_tokens[i].eql?(t_tokens[i])
                    return false
                end
            end
            i = i + 1
        end
        return true
    end
    def Lexicon.match_token(yaml_instance, word, structure)
        begin
            if yaml_instance.get_data()[structure].include? word
                return true
            else
                return false
            end
        rescue
            return false
        end
    end
    def Lexicon.get_tokens(query)
        return query.split(" ")
    end
    def Lexicon.get_number_of_tokens(query)
        return Lexicon.get_tokens(query).length
    end
    def Lexicon.has_equal_tokens(a, b)
        if Lexicon.get_number_of_tokens(a) == Lexicon.get_number_of_tokens(b)
            return true
        else
            return false
        end
    end
end