class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.items.each do |item|
      total += item.price
    end
    total
  end

  def add_item(item)
    if existing_item = LineItem.find_by(item_id: item)
      existing_item.quantity += 1
      existing_item
    else
      self.line_items.build(item_id: item, cart_id: self.id, quantity: 1)
    end
  end
end
