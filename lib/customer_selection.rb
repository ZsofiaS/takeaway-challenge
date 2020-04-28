class CustomerSelection
    
  attr_reader :selection, :dish, :quantity, :continue, :menu, :total
    
  def initialize(menu = Menu.new)
    @selection = {}
    @dish = nil
    @quantity = nil
    @continue = "Y"
    @menu = menu
    @total = 0
  end  
    
  def select_dish
    puts "Please enter dish:"
    @dish = gets.chomp
  end
  
  def select_quantity
    puts "Please enter quantity:"
    @quantity = gets.chomp
  end
  
  def select_continue
    puts "Continue?"
    @continue = gets.chomp
  end
  
  def place_order
    loop do
      select_dish
      select_quantity
      select_continue
      @selection[@dish] = @quantity
      break if @continue == "N"
    end
  end
  
  def print_order
    @selection.each do |key, value|
      puts "#{key}: #{value}x £#{@menu.listOfDishes[key.to_sym] * value.to_i}"
   end
   puts "Total: £#{calculate_total}"
  end
  
  private
  
  def calculate_total
    @total = 0
    @selection.each do |key, value|
      @total += @menu.listOfDishes[key.to_sym] * value.to_i
    end
    @total
  end
  
end