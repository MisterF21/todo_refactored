require './lib/list'

class Task
  @@all_tasks = []

  def Task.all
    @@all_tasks
  end

  def Task.clear
    @@all_tasks = []
  end

  def initialize(description)
    @description = description
  end

  def description
    @description
  end

  def save
    @@all_tasks << self
  end
end



# test_list = List.new("Chores")
# task_to_add = Task.new("rake")
# test_list.add_task(task_to_add)

# p test_list.tasks.length
# p test_list.tasks[0].description
# p task_to_add
# p test_list.tasks

