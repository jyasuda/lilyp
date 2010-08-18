class Category < ActiveRecord::Base
  has_and_belongs_to_many :products

  # validation stuff...
  validates :name, :presence => true
end
