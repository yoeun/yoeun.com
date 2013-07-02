require 'sinatra/base'

class App < Sinatra::Base
	set :public_folder, 'public'

  def initialize
    super()
  end

  get '/' do
  	require 'yaml'
  	filename = 'data/resume.yml'
	resume = YAML.load_file(filename)
	mtime = File.mtime(filename)
    haml :index, format: :html5, locals: { data: resume, mtime: mtime }
  end
end