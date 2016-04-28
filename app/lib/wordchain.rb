require 'active_record'
require_relative '../models/entries'

class WordChain
  def self.next_word(previous_tokens)
    tokens = Entries.where(word: previous_tokens[0], nword: previous_tokens[1]).order(count: :desc)
    find_best_token(tokens)
  end

  def self.bigram_word(previous_token)
    tokens = Entries.where(word: previous_token).order(count: :desc)
    find_best_token(tokens)
  end

  private
  def self.find_best_token(tokens)
    return "" if(tokens.length == 0)

    tokens.map(&:definition).each do |token|
      return token if rand < 0.9
    end
    return tokens.last.definition
  end
end
