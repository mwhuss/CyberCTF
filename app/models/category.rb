class Category < ActiveRecord::Base

  has_many :challenges

  validates_uniqueness_of :name
end
