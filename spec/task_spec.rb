require 'spec_helper'

describe(Task) do

  describe '#==' do
    it 'is the same task if it has same description' do
      task1 = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => 2012-12-22})
      task2 = Task.new({:description => 'learn SQL', :list_id => 1, :due_date => 2012-12-22})
      expect(task1).to(eq(task2))
    end
  end

  describe '#sort' do
    it 'sorts tasks by due date, starting from earlist' do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '1991-12-02'})
      test_task_too = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '1991-12-01'})
      tasks = Task.all
      expect(tasks.sort).to(eq(tasks))
    end
  end

  describe('#description') do
    it('lets you give a description') do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 2012-12-22})
      expect(test_task.description()).to (eq("learn SQL"))
    end
  end
  describe(".all") do
    it("is empty at first") do
      expect(Task.all()).to(eq([]))
    end
  end
  describe("#save") do
    it("adds a task to an array of saved tasks") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '2012-12-22'})
      test_task.save()
      expect(Task.all()).to(eq([test_task]))
    end
  end
  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 2012-12-22})
      expect(test_task.list_id()).to(eq(1))
    end
  end

end
