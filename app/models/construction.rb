class Construction < ActiveRecord::Base
  has_and_belongs_to_many :products

  # validation stuff...
  validates :description, :presence => true
end
