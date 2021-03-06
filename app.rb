require 'bundler'
Bundler.require
require 'debugger'

Dir.glob('./lib/*.rb') do |model|
  require model
end

module Name
  class App < Sinatra::Application

    #configure
    configure do
      set :root, File.dirname(__FILE__)
      set :public_folder, 'public'
    end

    #routes
    get '/' do
      erb :day
    end

    get '/clothes/:latlng' do
      # debugger
      clothes_predict = Weather.get_weather(params[:latlng])
      {"clothes" => clothes_predict}.to_json
    end

    # post '/' do
    #   @time = Time.new
    #   erb :index
    # end

    #helpers
    helpers do
      def partial(file_name)
        erb file_name, :layout => false
      end
    end

  end
end
