require 'rubygems'
require 'sinatra'

new_cg = -1

get '/' do
	data = Hash.new
	data[:new_cg] = new_cg.round(2)
	new_cg = -1	
	erb :index, locals: data
end

post '/cal' do
	cg = params["cgpa"].to_f
	sg = params["sgpa"].to_f
	new_cg = ((cg*3.0)+sg)/4.0
	return redirect '/'
end