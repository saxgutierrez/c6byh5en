class Product < ActiveRecord::Base

	validates :name, :price, presence: true, on: :create
	validates :price, numericality: {only_double: true}, on: :create
end
