require 'rubygems'
require 'compass'
require 'sinatra'
require 'haml'

configure :production do
  # Configure stuff here you'll want to
  # only be run at Heroku at boot

  # TIP:  You can get you database information
  #       from ENV['DATABASE_URI'] (see /env route below)
end

# configure compass
Compass.configuration do |config|
  config.project_path = File.dirname(__FILE__)
  config.sass_dir = File.join(Sinatra::Application.views, 'stylesheets')
  config.output_style = :compact
end

# at a minimum, the main sass file must reside within the ./views directory. here, we create a ./views/stylesheets directory where all of the sass files can safely reside.
get '/stylesheets/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass :"stylesheets/#{params[:name]}", Compass.sass_engine_options
end

get '/' do
  haml :index
end

get '/songs' do
  haml :songs
end

# You can see all your app specific information this way.
# IMPORTANT! This is a very bad thing to do for a production
# application with sensitive information

# get '/env' do
#   ENV.inspect
# end
