require 'rubygems'
require 'sinatra'
require 'csv'

class ToDo 
 	def add_task(task_description)
 			CSV.open("todo.csv", "ab") do |csv|
 			csv << [task_description]
 		end
 	end

 	def complete_task(task_description)
		tasks_array = CSV.read('todo.csv')
		tasks_array.delete_if do |key, value| 
			key == task_description
		end
		CSV.open("todo.csv", "wb") do |csv|
			tasks_array.each { |i| csv << i }
		end	
 	end
end


get '/' do 
	erb :add
end

get '/add' do
	erb :add
end

post '/add' do
	task_description = params[:task]
	ToDo.new.add_task(params[:task])
	erb :add
end

get '/completed' do
	erb :completed
end

post '/completed' do
	task_description = params[:task]
	ToDo.new.complete_task(params[:task])
	erb :completed		
end