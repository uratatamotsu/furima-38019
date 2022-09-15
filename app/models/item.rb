class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :situation
  belongs_to :shipping_cost
  belongs_to :delivery_area
  belongs_to :shipping_days


  validates :exhibits_name, presence: true
  validates :exhibits_text, presence: true
  validates :money, presence: true, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :situation_id, presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_cost_id, presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :delivery_area_id, presence: true, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_days_id, presence: true, numericality: { other_than: 1, message: "can't be blank"} 

  belongs_to :user
  has_one_attached :image
  validates :image, presence: true

end
