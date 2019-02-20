class Market
  attr_reader :name,
              :vendors
  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor if !@vendors.include?(vendor)
  end

  def vendor_names
    @vendors.map{|vendor| vendor.name}
  end

  def vendors_that_sell(item)
    vendors.select{|vendor| vendor.inventory.include?(item)}
  end

  def sorted_item_list
    items = []
    vendors.each do |vendor|
      items = items | vendor.inventory.keys
    end
    return items.sort
  end

  def total_inventory
    inventory = {}
    @vendors.each do |vendor|
      vendor.inventory.each do |item,quantity|
        if inventory.has_key?(item)
          inventory[item] += quantity
        else
          inventory[item] = quantity
        end
      end
    end
    return inventory
  end
end
