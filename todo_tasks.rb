require './lib/task'
require './lib/list'

@master_list = []
@current_list = []

system "clear"
def main_menu
  system "clear"
  puts "\e[94mPress 'a' to add a list"
  puts "Press 'l' to list all of your lists."
  puts "Press 'x' to exit.\e[0m"
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
    system "clear"
    puts "\e[91mSorry, that wasn't a valid option.\e[0m"
    main_menu
  end
end

def add_list
  puts "\e[94mEnter name of the new list:\e[0m"
  list_name = gets.chomp
  @current_list = List.new(list_name)
  @master_list << @current_list
  puts "\e[92mList added.\n\e[0m"
  list_tasks
end

def list_lists
  system "clear"
  @master_list.each_with_index do |list, index|
    puts (index + 1).to_s + ". " + @master_list[index].list_name
  end
  puts "\e[94m\nSelect list number to go to list"
  puts "Press m for main menu\e[0m"
  list_option_choice = gets.chomp
  @master_list.each_with_index do |list, index|
    if (list_option_choice.to_i - 1) == index
      @current_list = @master_list[index]
      system "clear"
      list_tasks
    end
  end
end

def list_tasks
  if @current_list.tasks.length == 0
    add_task
  else
    system "clear"
    puts "\e[94mHere are all of your tasks:\e[0m"
    @current_list.tasks.each_with_index do |task, index|
      puts (index + 1).to_s + ". " + @current_list.tasks[index]
    end
    puts "\e[94mPress 'a' to add another task to your list."
    puts "Press 'd' to delete a done task off your list."
    puts "Press 'm' to go back to the main menu.\e[0m"
    task_choice = gets.chomp
    if task_choice == 'a'
      add_task
    elsif task_choice == 'd'
      delete_task
    elsif task_choice == 'm'
      main_menu
    else
      system "clear"
      puts "\e[91mSorry, that wasn't a valid option.\e[0m"
      list_tasks
    end
  end
end

def add_task
  puts "\e[94mEnter a description of the new task:\e[0m"
  user_description = gets.chomp
  @current_list.add_task(user_description)
  puts "\e[92mTask added.\n\e[0m"
  list_tasks
end

def delete_task
  system "clear"
  puts "\e[94mEnter the number of the task you would like to delete from your list.\e[0m"
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
