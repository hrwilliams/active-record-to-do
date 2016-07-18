require('pg')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('sinatra/activerecord')
require('./lib/task')
require('./lib/list')


get('/') do
  @tasks = Task.all()
  erb(:index)
end

get('/lists') do
  @lists = List.all()
  erb(:lists)
end

post('/tasks') do
  description = params.fetch('description')
  task = Task.new({:description => description})
  task.save()
  erb(:success)
end

get('/tasks/:id/edit') do
  @task = Task.find(params.fetch("id").to_i)
  erb(:task_edit)
end

patch("/tasks/:id") do
  description = params.fetch("description")
  @task = Task.find(params.fetch("id").to_i())
  @task.update({:description => description})
  @tasks = Task.all()
  erb(:index)
end

get('/lists/new') do
  erb(:list_form)
end

post('/lists') do
  name = params.fetch('list_name')
  list = List.new({:name => name})
  list.save()
  erb(:success)
end
