class Pub

  attr_reader :name, :food
  attr_accessor :till, :drinks

  def initialize(name, till, drinks, food)
    @name = name
    @till = till
    @drinks = drinks
    @food = food
    @stock = {}
  end


  def add_drink_to_pub(drink)
    @drinks.push(drink)
  end

  def sell_drink(customer, drink)

    if customer.age >= 18
      if customer.drunkenness < 8
      @till += drink.price
      customer.wallet -= drink.price
      customer.drunkenness += drink.alcohol_units
      end
      return "Sorry, you're too drunk"
    end
    return "Sorry, you're too young"
  end



  def sell_food(customer, food)
    customer.wallet -= food.price
    customer.drunkenness -= food.rejuvenation
    @till += food.price
  end

end
