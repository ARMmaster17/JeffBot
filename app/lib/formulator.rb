require_relative 'wordchain'

module Formulator
  def Formulator.create_sentence(length, subject)
    iterator = 0
    result = []
    result << subject.chomp
    previous_token = subject
    token = WordChain.bigram_word(previous_token)
    for _ in 0..length
      break if token.eql?("") || token.eql?(nil) || iterator > length
      result << token.chomp
      earlier_token = previous_token
      previous_token = token
      token = WordChain.next_word([earlier_token, previous_token])
    end

    result.join(' ')
  end

  def Formulator.create_sentence_random(subject)
    return Formulator.create_sentence(3 + rand(8), subject)
  end
end
