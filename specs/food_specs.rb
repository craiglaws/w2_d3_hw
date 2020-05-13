require('minitest/autorun')
require('minitest/reporters')
require_relative('../Food')
require_relative('../Pub')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestFood < MiniTest::Test
  def setup()

    @food1 = Food.new("Chips", 2, 3)

  end

  def test_initialize_food
    assert_equal("Chips", @food1.name)
    assert_equal(2, @food1.price)
    assert_equal(3, @food1.rejuvenation)
  end 
end
