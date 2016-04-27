module Ngram
    def Ngram.ngrams(n, string)
        string.split(' ').each_cons(n).to_a
    end
    def Ngram.bigram(string)
        return ngrams(2, string)
    end
    def Ngram.trigram(string)
        return ngrams(3, string)
    end
end