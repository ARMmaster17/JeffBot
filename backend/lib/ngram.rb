module Ngram
    def Ngram.ngrams(n, string)
        string.split(' ').each_cons(n).to_a
    end
    def Ngram.bigram(string)
        return ngrams(2, string)
    end
end