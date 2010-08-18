class Photo < ActiveRecord::Base
  belongs_to :product

  has_attached_file :image,
    :url => "/kimono/:product_category/:product_size/:attachment/:id/:style/:product_name.:extension",
    :path => ":rails_root/public/kimono/:product_category/:product_size/:attachment/:id/:style/:product_name.:extension",
    :styles => {
    :original => '618x924>',
    :medium =>  '206x308>',
    :small => '93x140>',
    :thumb =>  '52x78>'
  },
    :convert_options => {
    :all => "-strip"
  }

  # validation stuff...
  validates_attachment_presence :image
  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/jpg']
  validates_attachment_size :image, :less_than => 1.megabytes
 # validates :source, :sort, :presence => true
end
