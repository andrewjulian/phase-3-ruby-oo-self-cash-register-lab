require "pry"

class CashRegister

  attr_accessor :total, :discount, :lastItemPrice, :lastItemQuantity

  def initialize(employeeDiscount = 0)
    @total = 0
    @discount = employeeDiscount
    @items = []
  end

  def add_item(item, price, quantity = 1)
    self.total = self.total + (price * quantity)
    @lastItemPrice = price
    @lastItemQuantity = quantity
    quantity.times{self.items << item}
  end

  def apply_discount
    if self.discount != 0
      self.total = self.total - (self.total * (self.discount/100.0))
      "After the discount, the total comes to $#{self.total.to_i}."
    else
      "There is no discount to apply."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total = @total - (lastItemPrice * lastItemQuantity)
  end

end
