class Challenge < ActiveRecord::Base
  belongs_to :category
  
  validates_presence_of     :name
  validates_uniqueness_of   :name
                            
  validates_presence_of     :description
                            
  validates_presence_of     :flag
  validates_uniqueness_of   :flag
  
  validates_numericality_of :points
  
  has_many :wins
  has_many :users, :through => :wins

  
end
