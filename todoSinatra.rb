require 'rubygems'
require 'sinatra'
require 'csv'
require 'sinatra/activerecord'
set :database, 'sqlite:///todo.db'

class AddedTask < ActiveRecord::Base
	attr_accessible :task
end

get '/' do 
	erb :add
end

get '/add' do
	erb :add
end

post '/add' do
	@task = AddedTask.create(:task => "#{params[:tasks]}")
	erb :add
end

get '/completed' do
	erb :completed
end

post '/completed' do
	task_description = params[:task]
	AddedTask.delete("#{params[:task]}")
	erb :completed		
end