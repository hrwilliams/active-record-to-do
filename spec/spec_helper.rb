ENV['RACK_ENV'] = 'test'

require("pg")
require("rspec")
require('sinatra/activerecord')
require("list")
require("task")
require("pry")


RSpec.configure do |config|
  config.after(:each) do

    Task.all().each() do |task|
      task.destroy()
    end
    List.all().each() do |list|
      list.destroy()
    end

  end
end
