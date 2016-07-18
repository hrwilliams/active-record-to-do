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
get('/lists/new') do
  erb(:list_form)
end

get('/lists/:id') do
  @list = List.all()
  @list = List.find(params.fetch('id').to_i())
  erb(:list)
end

post('/lists') do
  @tasks =  Task.all()
  name = params.fetch('name')
  list = List.new({:name => name})
  list.save()
  erb(:success)
end

# get('/tasks') do
#   @tasks = Task.all()
#   erb(:tasks)
# end
# post('/tasks') do
#   @tasks = Task.all()
#   description = params.fetch('description')
#   @task = Task.new({:description => description, :done => false})
#   if @task.save()
#     erb(:success)
#   else
#     erb(:index)
#   end
# end
#
#

# post('/lists') do
#   description = params.fetch('description')
#   task = Task.new({:description => description})
#   task.save()
#   erb(:success)
# end
# get('/tasks/:id/edit') do
#   @task = Task.find(params.fetch("id").to_i)
#   erb(:task_edit)
# end
#
# post("/tasks/:id") do
#   description = params.fetch("description")
#   @task = Task.find(params.fetch("id").to_i())
#   @task.update({:description => description})
#   @tasks = Task.all()
#   erb(:index)
# end
