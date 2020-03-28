class Product < ApplicationRecord
  validates_presence_of :name, :price, :searchable
  validates_uniqueness_of :name
end
