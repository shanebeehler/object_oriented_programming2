class Item
  @@taxes_total
  def initialize(item, price)
    @item = item
    @price = price
    @price_with_tax = price
  end

  def imported(@price)
    import_tax = @price * 0.05
    @@taxes_total += import_tax
    @price_with_tax += import_tax
  end

  def sales_tax(@price)
    sales_tax = @price * 0.1
    @@taxes_total += sales_tax
    @price_with_tax += sales_tax
  end
end

class Receipt < Item
  puts "1 #{@item} : "


end

book = Item.new("book", 12.49)
cd = Item.new("music CD", 14.99)
cb = Item.new("chocolate bar", 0.85)
