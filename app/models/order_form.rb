class OrderForm
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :delivery_area_id, :city, :address, :building, :tell, :token


  with_options presence: true do
    
    validates :user_id
    validates :item_id
    
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank"} 
    validates :city
    validates :address
    validates :tell, format: { with: /\A[0-9]{10,11}\z/, message: 'is invalid' }
    
    validates :token
  end


  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    
    Purchase.create(order_id: order.id, post_code: post_code, delivery_area_id: delivery_area_id, city: city, address: address, building: building, tell: tell)
  end
end