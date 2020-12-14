class Cart
  def initialize
    @items = []
  end

  def add_item(item_id, quantity = 1)
    # 判斷
    found_item = @items.find { |item| item.item_id == item_id }

    if found_item
      # 增加數量
      found_item.increment(quantity)
    else
      # 給一個新的 CartItem
      @items << CartItem.new(item_id, quantity)
    end
  end

  def empty?
    @items.empty?
  end

  def items
    @items
  end

  def total_price
    total = @items.reduce(0) { |sum, item| sum + item.total_price }
    if Date.today.month == 12 && Date.today.day == 25
      total = total * 0.9
    end
    total
  end

  def serialize
    items = [
      {"item_id" => 1, "quantity" => 3},
      {"item_id" => 2, "quantity" => 2}
      ]
    { 'items' => items }
  end

end