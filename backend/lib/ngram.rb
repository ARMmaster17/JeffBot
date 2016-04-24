module Ngram
    def ngrams(n, string)
        string.split(' ').each_cons(n).to_a
    end
    def bigram(string)
        return ngrams(2, string)
    end
end