require 'sinatra/base'

class App < Sinatra::Base
	set :public_folder, 'public'

  def initialize
    super()
  end

  get '/' do
  	require 'yaml'
		resume = YAML.load_file('data/resume.yml')
    haml :index, :format => :html5, :locals => { :data => resume }
  end
end