require_relative 'config/environment'
require_relative 'models/text_analyzer.rb'
# require_relative "models/textanalyzer.rb"

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text]).to_s

    erb :results
  end
end
