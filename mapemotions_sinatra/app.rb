require 'rubygems'
require 'sinatra'

col1 = 0
col2 = 0
col3 = 0
col4 = 0
col5 = 0
col6 = 0

pes_score = 0
aes_score = 0
ces_score = 0

pes_percent = 0.0
aes_percent = 0.0
ces_percent = 0.0

user_name = ""
school = ""
branch = ""
employee_id = ""
designation = ""

flag = 0

get '/' do
	erb :index
end

get '/result' do

	if flag == 0
		return redirect '/'
	end

	data = Hash.new

	data[:pes_score] = pes_score
	data[:pes_percent] = pes_percent

	data[:aes_score] = aes_score
	data[:aes_percent] = aes_percent

	data[:ces_score] = ces_score
	data[:ces_percent] = ces_percent

	data[:col1] = col1
	data[:col2] = col2
	data[:col3] = col3
	data[:col4] = col4
	data[:col5] = col5
	data[:col6] = col6

	data[:user_name] = user_name
	data[:school] = school
	data[:branch] = branch
	data[:employee_id] = employee_id
	data[:designation] = designation

	col1 = 0
	col2 = 0
	col3 = 0
	col4 = 0
	col5 = 0
	col6 = 0

	pes_score = 0
	aes_score = 0
	ces_score = 0

	pes_percent = 0.0
	aes_percent = 0.0
	ces_percent = 0.0

	user_name = ""
	school = ""
	branch = ""
	employee_id = ""
	designation = ""

	flag = 0

	erb :result, locals: data
end

post '/cal' do

	col1arr = [3, 11, 19, 24, 35, 36]
	col2arr = [9, 17, 22, 27, 31, 32]
	col3arr = [1, 4, 14, 16, 21, 28]
	col4arr = [8, 10, 12, 18, 25, 29]
	col5arr = [7, 13, 15, 20, 30, 34]
	col6arr = [2, 5, 6, 23, 26, 33]
	

	for i in col1arr
		if params["ques#{i}"] == "b"
			col1 += 1
		elsif params["ques#{i}"] == "c"
			col1 += 2
		elsif params["ques#{i}"] == "d"
			col1 += 3
		elsif params["ques#{i}"] == "e"
			col1 += 4
		end
	end

	for i in col2arr
		if params["ques#{i}"] == "b"
			col2 += 1
		elsif params["ques#{i}"] == "c"
			col2 += 2
		elsif params["ques#{i}"] == "d"
			col2 += 3
		elsif params["ques#{i}"] == "e"
			col2 += 4
		end
	end

	for i in col3arr
		if params["ques#{i}"] == "b"
			col3 += 1
		elsif params["ques#{i}"] == "c"
			col3 += 2
		elsif params["ques#{i}"] == "d"
			col3 += 3
		elsif params["ques#{i}"] == "e"
			col3 += 4
		end
	end

	for i in col4arr
		if params["ques#{i}"] == "b"
			col4 += 1
		elsif params["ques#{i}"] == "c"
			col4 += 2
		elsif params["ques#{i}"] == "d"
			col4 += 3
		elsif params["ques#{i}"] == "e"
			col4 += 4
		end
	end

	for i in col5arr
		if params["ques#{i}"] == "b"
			col5 += 1
		elsif params["ques#{i}"] == "c"
			col5 += 2
		elsif params["ques#{i}"] == "d"
			col5 += 3
		elsif params["ques#{i}"] == "e"
			col5 += 4
		end
	end

	for i in col6arr
		if params["ques#{i}"] == "b"
			col6 += 1
		elsif params["ques#{i}"] == "c"
			col6 += 2
		elsif params["ques#{i}"] == "d"
			col6 += 3
		elsif params["ques#{i}"] == "e"
			col6 += 4
		end
	end

	pes_score = (col1+col2)/2
	aes_score = col3
	ces_score = (col4+col5+col6)/3

	pes_percent = (pes_score * 4.16	).to_f.round(2)
	aes_percent = (aes_score * 4.16	).to_f.round(2)
	ces_percent = (ces_score * 4.16	).to_f.round(2)

	flag = 1

	user_name = params["user_name"]
	school = params["school"]
	branch = params["branch"]
	employee_id = params["employee_id"]
	designation = params["designation"]

	return redirect '/result'

end