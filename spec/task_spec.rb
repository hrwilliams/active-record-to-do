require 'spec_helper'

describe(Task) do

  describe '#sort' do
    it 'sorts tasks by due date, starting from earlist' do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '1991-12-02'})
      test_task_too = Task.new({:description => "learn SQL", :list_id => 1, :due_date => '1991-12-01'})
      tasks = Task.all
      expect(tasks.sort).to(eq(tasks))
    end
  end

  describe("#list_id") do
    it("lets you read the list ID out") do
      test_task = Task.new({:description => "learn SQL", :list_id => 1, :due_date => 2012-12-22})
      expect(test_task.list_id()).to(eq(1))
    end
  end

end
