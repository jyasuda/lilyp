class Style < ActiveRecord::Base
 
  # validation stuff...
  validates :name, :presence => true
end
