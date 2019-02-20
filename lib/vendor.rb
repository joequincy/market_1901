class Vendor
  attr_reader :name,
              :inventory

  def initialize(name)
    @name = name
    @inventory = {}# you decide what goes here...
  end

  def check_stock(item)
    if @inventory.has_key?(item)
      @inventory.find{|name,details| name = item}[1]
    else
      0
    end
  end

  def stock(item, quantity)
    if @inventory.has_key?(item)
      @inventory[item] += quantity
    else
      @inventory[item] = quantity
    end
  end
end
