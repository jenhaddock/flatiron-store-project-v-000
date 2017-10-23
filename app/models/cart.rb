class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def total
    total = 0
    self.line_items.each { |line_item|
      total = total + (line_item.quantity * line_item.item.price)
    }
    total
  end

  def add_item(item_id)
    if self.line_items.find_by(item_id: item_id, cart_id: self.id)
      line_item = self.line_items.find_by(item_id: item_id, cart_id: self.id)
      line_item.quantity += 1 unless line_item.item.inventory == 0
    else
      line_item = self.line_items.new(item_id: item_id, cart_id: self.id, quantity: 1)
    end
    line_item
  end
end
