require 'rubygems'
require 'sinatra'
require 'csv'

class ToDo

	def add_task
				CSV.open("todo.csv", "ab") do |csv|
			csv << [@task]
		end

	end


# 	def add_task
# 			CSV.open("todo.csv", "ab") do |csv|
# 			csv << [@task, @status]
# 		end
# #		puts "New Task Added!"
# 	end
 end

get '/' do 
	erb :add
end

get '/add' do
	ToDo.new.add_task
	erb :add
	@task = "#{params[:task]}"
end

post '/add' do
#	if "#{params[:status]}" == "new"

		erb :add

#	erb :add
#		ToDo.new.add_task
end

get '/completed' do
	erb :completed
end

post '/completed' do
	tasks_array = CSV.read('todo.csv')
	tasks_array.delete_if do |key, value| 
		key == "#{params[:task]}"
	end
	CSV.open("todo.csv", "wb") do |csv|
		tasks_array.each { |i| csv << i }
	end	
	erb :completed		
end


get '/list' do
	erb :list
end

 post '/list' do
	erb :list 
end