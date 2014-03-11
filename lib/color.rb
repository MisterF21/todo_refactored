class Color
  def Color.green(string)
    "\e[92m" + string + "\e[0m"
  end

  def Color.blue(string)
    "\e[94m" + string + "\e[0m"
  end
end
