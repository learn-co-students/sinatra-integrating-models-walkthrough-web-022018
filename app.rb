
require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    text_from_user = TextAnalyzer.new(params[:user_text])
    @words = text_from_user.count_of_words.to_s
    @vowels = text_from_user.count_of_vowels.to_s
    @consonants = text_from_user.count_of_consonants.to_s
    # @letter = text_from_user.most_used_letter
    @l = text_from_user.most_used_letter.keys.join.upcase
    @times = text_from_user.most_used_letter.values.join
    # binding.pry
    erb :results
  end

  # post '/' do
  #   @analyzed_text = TextAnalyzer.new(text_from_user)
  #
  #   @analyzed_text.count_of_words
  #   @analyzed_text.count_of_vowels
  #   @analyzed_text.count_of_consonants
  #   binding.pry
  #   @analyzed_text.most_used_letter
  #
  #   erb :results
  # end
end
