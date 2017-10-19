require 'rubygems'
require 'sinatra'

col1_a = 0
col1_b = 0

col2_a = 0
col2_b = 0

col3_a = 0
col3_b = 0

col4_a = 0
col4_b = 0

my_result = ""

get '/' do

	erb :index

end

get '/result' do

	if my_result == ""
		return redirect '/'
	end

	data = Hash.new

	data[:col1_a] = col1_a
	data[:col1_b] = col1_b

	data[:col2_a] = col2_a
	data[:col2_b] = col2_b

	data[:col3_a] = col3_a
	data[:col3_b] = col3_b

	data[:col4_a] = col4_a
	data[:col4_b] = col4_b

	data[:my_result] = my_result

	col1_a = 0
	col1_b = 0

	col2_a = 0
	col2_b = 0

	col3_a = 0
	col3_b = 0

	col4_a = 0
	col4_b = 0

	my_result = ""

	erb :result, locals: data
end

post '/cal' do

	col1 = [1,5,9,13,17,21,25,29,33,37,41,45,49,53,57,61,65,69,73,77,81,85,89,93,97,101,105,109,113,117,121]
	col2 = [2,6,10,14,18,22,26,30,34,38,42,46,50,54,58,62,66,70,74,78,82,86,90,94,98,102,106,110,114,118,122]
	col3 = [3,7,11,15,19,23,27,31,35,39,43,47,51,55,59,63,67,71,75,79,83,87,91,95,99,103,107,111,115,119,123]
	col4 = [4,8,12,16,20,24,28,32,36,40,44,48,52,56,60,64,68,72,76,80,84,88,92,96,100,104,108,112,116,120,124]

	for i in col1
		if params["ques#{i}"] == "a"
			col1_a = col1_a + 1
		else
			col1_b = col1_b + 1
		end
	end

	for i in col2
		if params["ques#{i}"] == "a"
			col2_a = col2_a + 1
		else
			col2_b = col2_b + 1
		end
	end
	
	for i in col3
		if params["ques#{i}"] == "a"
			col3_a = col3_a + 1
		else
			col3_b = col3_b + 1
		end
	end

	for i in col4
		if params["ques#{i}"] == "a"
			col4_a = col4_a + 1
		else
			col4_b = col4_b + 1
		end
	end

	if col1_a > col1_b
		my_result += "E"
	else
		my_result += "I"
	end

	if col2_a > col2_b
		my_result += "S"
	else
		my_result += "N"
	end

	if col3_a > col3_b
		my_result += "T"
	else
		my_result += "F"
	end

	if col4_a > col4_b
		my_result += "J"
	else
		my_result += "P"
	end

	return redirect '/result'

end