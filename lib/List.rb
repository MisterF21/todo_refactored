require './lib/task'

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
