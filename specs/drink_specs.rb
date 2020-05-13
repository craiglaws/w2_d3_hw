require('minitest/autorun')
require('minitest/reporters')
require_relative('../Drink')
require_relative('../Pub')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestDrink < MiniTest::Test
  def setup()

    @drink1 = Drink.new("Tennents", 3, 1)
    @drink2 = Drink.new("Vodka", 4, 2)
    @drink3 = Drink.new("Strongbow", 4, 1)
    @drink4 = Drink.new("Pinot Grigio", 5, 3)

    @drinks = [@drink1, @drink2, @drink3, @drink4]

  end

  def test_initialize_drink
    assert_equal("Tennents", @drink1.name)
    assert_equal(5, @drink4.price)
    assert_equal(1, @drink3.alcohol_units)
  end
end
