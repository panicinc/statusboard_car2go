require File.join(File.expand_path(File.dirname(__FILE__)), 'app.rb')

map '/' do
  run Sinatra::Application
end
