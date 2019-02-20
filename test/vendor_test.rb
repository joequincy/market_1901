require 'minitest/autorun'
require 'minitest/pride'
require './lib/vendor'

class VendorTest < Minitest::Test
  def setup
    @vendor = Vendor.new("Rocky Mountain Fresh")
  end

  def test_it_exists
    assert_instance_of Vendor, @vendor
  end

  def test_it_has_a_name
    assert_equal "Rocky Mountain Fresh", @vendor.name
  end

  def test_inventory_starts_as_empty_hash
    assert_equal ({}), @vendor.inventory
  end

  def test_it_can_check_stock
    assert_equal 0, @vendor.check_stock("Peaches")
  end

  def test_it_can_add_stock
    @vendor.stock("Peaches", 30)
    assert_equal 30, @vendor.check_stock("Peaches")
  end

  def test_inventory_accumulates
    expected = {"Peaches" => 55, "Tomatoes" => 12}
    @vendor.stock("Peaches", 30)
    @vendor.stock("Peaches", 25)
    @vendor.stock("Tomatoes", 12)
    assert_equal expected, @vendor.inventory
  end
end
