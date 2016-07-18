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

describe('adding a new list', {:type => :feature}) do
  it('allows a user to add a list') do
    visit('/')
    click_link('Add New List')
    expect(page).to have_content('List Name:')
    fill_in('list_name', :with => 'anything')
    click_button('Add List')
    expect(page).to have_content('Success!')
  end
end

describe('viewing all of the lists', {:type => :feature}) do
  it('allows a user to see all of the lists that have been created') do
    visit('/')
    click_link('View All Lists')
    list = List.new({:name => 'Epicodus Homework'})
    list.save()
    expect(page).to have_content('Epicodus Homework')
  end
end
