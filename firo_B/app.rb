require 'rubygems'
require 'sinatra'

col1_EI = 0
col2_WC = 0
col3_EA = 0
col4_WI = 0
col5_WA = 0
col6_EC = 0

col1_EI_res = ""
col2_WC_res = ""
col3_EA_res = ""
col4_WI_res = ""
col5_WA_res = ""
col6_EC_res = ""

row1sum = 0
row2sum = 0
row1_res = ""
row2_res = ""

col1sum = 0
col2sum = 0
col3sum = 0
col1_res = "" 
col2_res = "" 
col3_res = "" 

totalsum = 0
total_res = ""

user_name = ""
school = ""
branch = ""
employee_id = ""
designation = ""

bool_arr = Array.new(54)

# U list if for questions who need ORring of option (a) only
# V list ORring of option (a) , (b)
# W list ORring of option (a) , (b) , (c)
# X list ORring of option (a) , (b) , (c) , (d)
# Y list ORring of option (d) , (e) , (f)
# Z list ORring of option (e) , (f)

U = [12,15,16,37,39,43]
V = [4,8,9,11,13,17,21,23,27,28,29,31,32,34,36,38,42,45,48,49,50,51,53,54]
W = [1,7,10,14,18,20,24,26,30,33,44,47]
X = [2,3,5,6,22,41]
Y = [19,25]
Z = [35,40,46,52]

flag = 0

get '/' do
	erb :index
end

get '/result' do

	if flag == 0
		return redirect '/'
	end

	data = Hash.new

	data[:col1_EI] = col1_EI
	data[:col2_WC] = col2_WC
	data[:col3_EA] = col3_EA
	data[:col4_WI] = col4_WI
	data[:col5_WA] = col5_WA
	data[:col6_EC] = col6_EC

	data[:col1_EI_res] = col1_EI_res
	data[:col2_WC_res] = col2_WC_res
	data[:col3_EA_res] = col3_EA_res
	data[:col4_WI_res] = col4_WI_res
	data[:col5_WA_res] = col5_WA_res
	data[:col6_EC_res] = col6_EC_res

	data[:row1sum] = row1sum
	data[:row2sum] = row2sum
	data[:col1sum] = col1sum
	data[:col2sum] = col2sum
	data[:col3sum] = col3sum
	data[:totalsum] = totalsum

	data[:row1_res] = row1_res
	data[:row2_res] = row2_res
	data[:col1_res] = col1_res
	data[:col2_res] = col2_res
	data[:col3_res] = col3_res
	data[:total_res] = total_res

	data[:user_name] = user_name
	data[:school] = school
	data[:branch] = branch
	data[:employee_id] = employee_id
	data[:designation] = designation

	col1_EI = 0
	col2_WC = 0
	col3_EA = 0
	col4_WI = 0
	col5_WA = 0
	col6_EC = 0

	col1_EI_res = ""
	col2_WC_res = ""
	col3_EA_res = ""
	col4_WI_res = ""
	col5_WA_res = ""
	col6_EC_res = ""

	row1sum = 0
	row2sum = 0
	row1_res = ""
	row2_res = ""

	col1sum = 0
	col2sum = 0
	col3sum = 0
	col1_res = "" 
	col2_res = "" 
	col3_res = "" 

	totalsum = 0
	total_res = ""

	user_name = ""
	school = ""
	branch = ""
	employee_id = ""
	designation = ""

	bool_arr = Array.new(54)

	flag = 0
	
	erb :result, locals: data
end

post '/cal' do

	for i in U
		if params["ques#{i}"] == "a"
			bool_arr[i] = 1
		else
			bool_arr[i] = 0
		end
	end

	for i in V
		if (params["ques#{i}"] == "a" || params["ques#{i}"] == "b")
			bool_arr[i] = 1
		else
			bool_arr[i] = 0
		end
	end
	
	for i in W
		if (params["ques#{i}"] == "a" || params["ques#{i}"] == "b" || params["ques#{i}"] == "c")
			bool_arr[i] = 1
		else
			bool_arr[i] = 0
		end
	end

	for i in X
		if (params["ques#{i}"] == "a" || params["ques#{i}"] == "b" || params["ques#{i}"] == "c" || params["ques#{i}"] == "d")
			bool_arr[i] = 1
		else
			bool_arr[i] = 0
		end
	end

	for i in Y
		if (params["ques#{i}"] == "d" || params["ques#{i}"] == "e" || params["ques#{i}"] == "f")
			bool_arr[i] = 1
		else
			bool_arr[i] = 0
		end
	end

	for i in Z
		if (params["ques#{i}"] == "e" || params["ques#{i}"] == "f")
			bool_arr[i] = 1
		else
			bool_arr[i] = 0
		end
	end

	col1QuesList = [1,3,5,7,9,11,13,15,16]
	col2QuesList = [2,6,10,14,18,20,22,24,26]
	col3QuesList = [4,8,12,17,19,21,23,25,27]
	col4QuesList = [28,31,34,37,39,42,45,48,51]
	col5QuesList = [29,32,35,38,40,43,46,49,52]
	col6QuesList = [30,33,36,41,44,47,50,53,54]

	for i in col1QuesList
		col1_EI += bool_arr[i]
	end

	for i in col2QuesList
		col2_WC += bool_arr[i]
	end

	for i in col3QuesList
		col3_EA += bool_arr[i]
	end

	for i in col4QuesList
		col4_WI += bool_arr[i]
	end

	for i in col5QuesList
		col5_WA += bool_arr[i]
	end

	for i in col6QuesList
		col6_EC += bool_arr[i]
	end

	if (col1_EI < 4)
		col1_EI_res = "L"
	elsif (col1_EI > 7)
		col1_EI_res = "H"
	else
		col1_EI_res = "-"
	end

	if (col2_WC < 3)
		col2_WC_res = "L"
	elsif (col2_WC > 6)
		col2_WC_res = "H"
	else
		col2_WC_res = "-"
	end

	if (col3_EA < 3)
		col3_EA_res = "L"
	elsif (col3_EA > 6)
		col3_EA_res = "H"
	else
		col3_EA_res = "-"
	end

	if (col4_WI < 5)
		col4_WI_res = "L"
	elsif (col4_WI > 8)
		col4_WI_res = "H"
	else
		col4_WI_res = "-"
	end

	if (col5_WA < 3)
		col5_WA_res = "L"
	elsif (col5_WA > 6)
		col5_WA_res = "H"
	else
		col5_WA_res = "-"
	end

	if (col6_EC < 2)
		col6_EC_res = "L"
	elsif (col6_EC > 5)
		col6_EC_res = "H"
	else
		col6_EC_res = "-"
	end

	row1sum = col1_EI + col3_EA + col6_EC
	row2sum = col2_WC + col4_WI + col5_WA

	col1sum = col1_EI + col4_WI
	col2sum = col2_WC + col6_EC
	col3sum = col3_EA + col5_WA

	totalsum = row1sum + row2sum

	if (row1sum < 9)
		row1_res = "L"
	elsif (row1sum > 18)
		row1_res = "H"
	else
		row1_res = "-"
	end

	if (row2sum < 11)
		row2_res = "L"
	elsif (row2sum > 20)
		row2_res = "H"
	else
		row2_res = "-"
	end

	if (col1sum < 9)
		col1_res = "L"
	elsif (col1sum > 15)
		col1_res = "H"
	else
		col1_res = "-"
	end

	if (col2sum < 5)
		col2_res = "L"
	elsif (col2sum > 11)
		col2_res = "H"
	else
		col2_res = "-"
	end

	if (col3sum < 6)
		col3_res = "L"
	elsif (col3sum > 12)
		col3_res = "H"
	else
		col3_res = "-"
	end

	if (totalsum < 20)
		total_res = "L"
	elsif (totalsum > 38)
		total_res = "H"
	else
		total_res = "-"
	end

	flag = 1

	user_name = params["user_name"]
	school = params["school"]
	branch = params["branch"]
	employee_id = params["employee_id"]
	designation = params["designation"]

	return redirect '/result'

end