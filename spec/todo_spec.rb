require 'rspec'
require 'task'

describe Task do
  before do
    Task.clear
  end

  it 'is initialized with a description' do
    test_task = Task.new('Wash the dishes')
    test_task.should be_an_instance_of Task
  end
  it "lets you read the description out" do
    test_task = Task.new('Wash the dishes')
    test_task.description.should eq "Wash the dishes"
  end

  describe '.all' do
    it 'starts as an empty array' do
      Task.all.should eq []
    end
    it 'adds a task to the all tasks array' do
      test_task = Task.new('Wash the dishes')
      test_task.save
      Task.all.should eq [test_task]
    end
  end

  describe '.clear' do
    it 'empties out the all saved tasks array' do
      Task.new('Wash the dishes').save
      Task.clear
      Task.all.should eq []
    end
  end

end

describe List do
  it 'is initialized with a description' do
    test_list = List.new("Chores")
    test_list.should be_an_instance_of List
  end
  it 'adds new tasks to a specified list' do
    test_list = List.new("Chores")
    task_to_add = Task.new("rake")
    test_list.add_task(task_to_add)
    test_list.tasks.should eq [task_to_add]
    test_list.tasks[0].description.should eq "rake"
  end
end
