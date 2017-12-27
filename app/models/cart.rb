class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each do |line_item|
      total += line_item.item.price * line_item.quantity
    end
    total
  end

  def add_item(item)
    if existing_item = LineItem.find_by(item_id: item, cart_id: self)
      existing_item.quantity += 1
      existing_item
    else
      self.line_items.build(item_id: item, cart_id: self.id, quantity: 1)
    end
  end

  def checkout
      self.line_items.each do |line_item|
      item = Item.find_by(title: line_item.item.title)
      item.inventory -= line_item.quantity
      item.save
    end
  end
end
