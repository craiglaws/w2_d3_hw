require('minitest/autorun')
require('minitest/reporters')
require_relative('../Customer')
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new
class TestCustomer < MiniTest::Test
  def setup()

    @customer1 = Customer.new("Craig", 20, 28)

  end


  def test_initialize
    assert_equal("Craig", @customer1.name)
    assert_equal(20, @customer1.wallet)
    assert_equal(28, @customer1.age)
    assert_equal(0, @customer1.drunkenness)
  end
end
