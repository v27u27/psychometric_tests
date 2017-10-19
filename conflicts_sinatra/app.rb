require 'rubygems'
require 'sinatra'

col1 = 0
col2 = 0
col3 = 0
col4 = 0
col5 = 0

flag =0

get '/' do
	erb :index
end

def colname(colnum)
	if colnum == "col1"
		return "Avoiding TURTLE"
	elsif colnum == "col2"
		return "Forcing SHARK"
	elsif colnum == "col3"
		return "Smoothing TEDDY BEAR"
	elsif colnum == "col4"
		return "Compromising FOX"
	elsif colnum == "col5"
		return "Confronting OWL"
	end
end

get '/result' do

	if flag == 0
		return redirect '/'
	end

	data = Hash.new
	data[:col1] = col1
	data[:col2] = col2
	data[:col3] = col3
	data[:col4] = col4
	data[:col5] = col5

	high1 = ""
	high2 = ""
	high1num = -1
	high2num = -1

	collapsing1 = ""
	collapsing2 = ""
	collapsingDiff = 999

	data.each do |key, val|
		if	val >= high1num
			high1num = val
			high1 = key
		end
	end

	data.each do |key, val|
		if	(val >= high2num && val <= high1num)
			if key != high1
				high2num = val
				high2 = key
			end
		end
	end

	data.each do |key1, val1|
		data.each do |key2, val2|
			if (key1 != key2)
				diff = [val1, val2].max - [val1, val2].min
				if( diff < collapsingDiff)
					collapsingDiff = diff
					collapsing1 = key1
					collapsing2 = key2
				end
			end
		end		
	end

	data[:high1] = colname(high1.to_s)
	data[:high1num] = high1num

	data[:high2] = colname(high2.to_s)
	data[:high2num] = high2num

	data[:collapsing1] = colname(collapsing1.to_s)
	data[:collapsing2] = colname(collapsing2.to_s)
	
	flag = 0
	col1 = 0
	col2 = 0
	col3 = 0
	col4 = 0
	col5 = 0

	high1 = ""
	high2 = ""
	high1num = -1
	high2num = -1

	collapsing1 = ""
	collapsing2 = ""
	collapsingDiff = 999

	erb :result, locals: data
end

post '/cal' do

	(1..35).step(5) do |i|
    	col1 += params["ques#{i}"].to_i
	end

	(2..35).step(5) do |i|
    	col2 += params["ques#{i}"].to_i
	end

	(3..35).step(5) do |i|
    	col3 += params["ques#{i}"].to_i
	end

	(4..35).step(5) do |i|
    	col4 += params["ques#{i}"].to_i
	end

	(5..35).step(5) do |i|
    	col5 += params["ques#{i}"].to_i
	end

	flag = 1 

	return redirect '/result'
end