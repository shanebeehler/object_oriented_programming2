class Item

  attr_writer :imported, :food_book_med
  attr_reader :item, :price, :price_with_tax

  def initialize(item, price, imported = false, food_book_med = false)
    @item = item
    @price = price
    @imported = imported
    @food_book_med = food_book_med
    @price_with_tax = @price
  end

  def price_with_taxes
    total = 0
    if @imported == true
      total += @price * 0.05
    end
    if @food_book_med == false
      total += @price * 0.1
    end
    @price_with_tax += total
  end
end

class Receipt
  def initialize
    @item_arr = []
  end
  def add_item(item)
    @item_arr << item
  end

  def loop_items
    @item_arr.each do |i|
      puts "1 #{i.item} : #{i.price_with_tax.round(2)}"
    end
  end
  def sales_tax_total
    @total_with = 0
    @total_without = 0
    @item_arr.each do |t|
      @total_with += t.price_with_tax
      @total_without += t.price
    end
  end

  def print_receipt
    the_total_sales_tax = (@total_with - @total_without).round(2)
    puts "Sales Taxes: #{the_total_sales_tax}"
    puts "Total: #{@total_with.round(2)}"
  end
end




book = Item.new("book", 12.49, false, true)
book.price_with_taxes

cd = Item.new("music CD", 14.99)
cd.price_with_taxes

cb = Item.new("chocolate bar", 0.85, false, true)
cb.price_with_taxes

receipt1 = Receipt.new
receipt1.add_item(book)
receipt1.add_item(cd)
receipt1.add_item(cb)
receipt1.sales_tax_total
receipt1.loop_items
receipt1.print_receipt

imported_chocolates = Item.new("imported box of chocolates", 10.00, true, true)
imported_chocolates.price_with_taxes

imported_perfume = Item.new("imported bottle of perfume", 47.50, true)
imported_perfume.price_with_taxes

receipt2 = Receipt.new
receipt2.add_item(imported_chocolates)
receipt2.add_item(imported_perfume)
receipt2.sales_tax_total
receipt2.loop_items
receipt2.print_receipt

imported_perfume2 = Item.new("imported bottle of perfume", 27.99, true)
imported_perfume2.price_with_taxes

perfume = Item.new("bottle of perfume", 18.99)
perfume.price_with_taxes

pills = Item.new("packet of headache pills", 9.75, false, true)
pills.price_with_taxes

imported_chocolates2 = Item.new("imported box of chocolates", 11.25, true, true)
imported_chocolates2.price_with_taxes

receipt3 = Receipt.new
receipt3.add_item(imported_perfume2)
receipt3.add_item(perfume)
receipt3.add_item(pills)
receipt3.add_item(imported_chocolates2)
receipt3.sales_tax_total
receipt3.loop_items
receipt3.print_receipt
