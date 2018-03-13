require_relative 'config/environment'
require_relative 'models/textanalyzer.rb'

class App < Sinatra::Base
  get '/' do
    erb :index
  end

  post '/' do
    @analyzed_text = TextAnalyzer.new(params[:user_text])
    erb :results
  end
end
