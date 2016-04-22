module Lexicon
    def Lexicon.clean(str)
        tokens = str.split(" ")
        result = ""
        tokens.each() do |token|
            result = result + " " + token.gsub(/[^a-zA-Z]/, "")
        end
        return result.strip.downcase
    end
end