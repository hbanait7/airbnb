class Listing < ActiveRecord::Base

  validates :title, :description, :price, prensence: true

end
