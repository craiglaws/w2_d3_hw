require('minitest/autorun')
require('minitest/reporters')
require_relative('../Pub')
require_relative('../Drink')
require_relative('../Customer')
require_relative('../Food')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestPub < MiniTest::Test
  def setup()

    @drink1 = Drink.new("Tennents", 3, 1)
    @drink2 = Drink.new("Vodka", 4, 2)
    @drink3 = Drink.new("Strongbow", 4, 1)
    @drink4 = Drink.new("Pinot Grigio", 5, 3)

    @drinks => {@drink1, @drink2, @drink3, @drink4}


    @customer1 = Customer.new("Craig", 20, 28)
    @customer2 = Customer.new("Emily", 2, 16)

    @food1 = Food.new("Chips", 2, 3)
    @food2 = Food.new("Pizza", 3, 4)
    @food3 = Food.new("Burger", 4, 5)

    @menu = [@food1, @food2, @food3]

    @pub1 = Pub.new("Hootenanny", 1000, @drinks, @menu)

  end

  def test_initialize_pub
    assert_equal("Hootenanny", @pub1.name)
    assert_equal(1000, @pub1.till)
    assert_equal(4, @pub1.drinks.count)
  end


  def test_add_drink_to_pub
    @pub1.add_drink_to_pub(@drink1)
    @pub1.add_drink_to_pub(@drink2)
    @pub1.add_drink_to_pub(@drink3)
    assert_equal(7, @pub1.drinks.count)
  end


  def test_sell_drink_to_customer
    @pub1.sell_drink(@customer1, @drink1)
    assert_equal(1003, @pub1.till)
    assert_equal(17, @customer1.wallet)
    assert_equal(1, @customer1.drunkenness)
  end

  def test_sell_if_under_18
    @pub1.sell_drink(@customer2, @drink4)
    assert_equal("Sorry, you're too young", @pub1.sell_drink(@customer2, @drink3))
    assert_equal(1000, @pub1.till)
    assert_equal(2, @customer2.wallet)
  end

  def test_refuse_if_too_drunk
    @pub1.sell_drink(@customer1, @drink4)
    @pub1.sell_drink(@customer1, @drink2)
    @pub1.sell_drink(@customer1, @drink4)
    @pub1.sell_drink(@customer1, @drink2)
    assert_equal(1014, @pub1.till)
    assert_equal(6, @customer1.wallet)
    assert_equal("Sorry, you're too drunk", @pub1.sell_drink(@customer1, @drink2))
  end


  def test_sell_food
    @pub1.sell_food(@customer1, @food1)
    assert_equal(-3, @customer1.drunkenness)
    assert_equal(18, @customer1.wallet)
    assert_equal(1002, @pub1.till)
  end




end
