require "spec_helper"
require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new task', {:type => :feature}) do
  it('allows a user to add a task to list') do
    visit('/')
    fill_in('description', :with =>'study')
    click_button('Add task')
    expect(page).to have_content('Success!')
  end
end

describe('viewing all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have been created') do
    visit('/')
    click_link('View All Lists')
    list = List.new({:name => 'Epicodus Homework'})
    list.save()
    expect(page).to have_content(list.name)
  end
end
