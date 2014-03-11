class Task
  def initialize(description)
    @description = description
  end
  def description
    @description
  end
end

class List
  def initialize(list_name)
    @list_name = list_name
    @tasks = []
  end
  def tasks
    @tasks
  end
  def add_task(new_task)
    @tasks << new_task

  end
  def list_name
    @list_name
  end

  def task_done(i)
    @tasks.delete_at(i)
  end

end


# test_list = List.new("Chores")
# task_to_add = Task.new("rake")
# test_list.add_task(task_to_add)

# p test_list.tasks.length
# p test_list.tasks[0].description
# p task_to_add
# p test_list.tasks

