class Product < ActiveRecord::Base

	validates :name, :price, presence: true, on: :create, on: :update
	validates :price, numericality: {only_double: true}, on: :create, on: :update
end
