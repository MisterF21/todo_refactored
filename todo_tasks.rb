require './lib/task'
require './lib/list'
require './lib/color'

@current_list = []

system "clear"
def main_menu
  system "clear"
  puts Color.blue "Press 'a' to add a list"
  puts Color.blue "Press 'l' to list all of your lists."
  puts Color.blue "Press 'x' to exit."
  main_choice = gets.chomp
  if main_choice == 'a'
    system "clear"
    add_list
  elsif main_choice == 'l'
    system "clear"
    list_lists
  elsif main_choice == 'x'
    system "clear"
    puts "Good-bye!\n"
    exit
  else
    main_menu
  end
end

def add_list
  puts Color.blue "Enter name of the new list:"
  list_name = gets.chomp
  @current_list = List.create(list_name)
  puts Color.green "List added.\n"
  list_tasks
end

def list_lists
  system "clear"
  puts Color.blue "Select list number to go to list\n"
  List.all.each_with_index do |list, index|
    puts (index + 1).to_s + ". " + List.all[index].list_name
  end
  puts "\n"
  if List.all.length > 0
    list_option_choice = gets.chomp
    List.all.each_with_index do |list, index|
      if (list_option_choice.to_i - 1) == index
        @current_list = List.all[index]
        system "clear"
        list_tasks
      end
    end
  else
    main_menu
  end
end

def list_tasks
  if @current_list.tasks.length == 0
    add_task
  else
    system "clear"
    puts Color.blue "Here are all of your tasks:"
    @current_list.tasks.each_with_index do |task, index|
      puts (index + 1).to_s + ". " + @current_list.tasks[index]
    end
    puts Color.blue "\nPress 'a' to add another task to your list."
    puts Color.blue "Press 'd' to delete a done task off your list."
    puts Color.blue "Press 'm' to go back to the main menu."
    task_choice = gets.chomp
    if task_choice == 'a'
      add_task
    elsif task_choice == 'd'
      delete_task
    elsif task_choice == 'm'
      main_menu
    else
      list_tasks
    end
  end
end

def add_task
  puts Color.blue "Enter a description of the new task:"
  user_description = gets.chomp
  @current_list.add_task(user_description)
  puts Color.green "Task added.\n"
  list_tasks
end

def delete_task
  system "clear"
  puts Color.blue "Enter the number of the task you would like to delete from your list."
  @current_list.tasks.each_with_index do |task, index|
    puts (index + 1).to_s + ". " + @current_list.tasks[index]
  end
  puts "\n"
  delete_choice = gets.chomp.to_i - 1
  @current_list.tasks.each_with_index do |task, index|
    if index == delete_choice
      @current_list.task_done(delete_choice)
    end
  end
  list_tasks
end

main_menu
