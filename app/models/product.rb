class Product < ActiveRecord::Base
  has_and_belongs_to_many :constructions
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :care_instructions
  has_and_belongs_to_many :groupings
  has_and_belongs_to_many :type_of_fits
  has_many :photos, :dependent => :destroy

  cattr_reader :per_page
  @@per_page = 5

  #  accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['image'].nil? }
  #  accepts_nested_attributes_for :photos, :reject_if => lambda { |t| t['photo'].nil? }
  accepts_nested_attributes_for :photos

  # validation stuff...
  validates :description, :startDate, :primaryCategory_id, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}

  def name
    # Category.find(primaryCategory_id).singular_name + "#{id}"
    Category.find(primaryCategory_id).singular_name + sprintf("-%04X", id)
  end

  def primaryCategoryName
    Category.find(primaryCategory_id).urlname
  end

  def sizeName
    Size.find(size_id).urlname
  end

end
