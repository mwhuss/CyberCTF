class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable, :validatable
  devise :database_authenticatable, :registerable, :rememberable, :trackable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :handle
  
  validates_uniqueness_of :handle
  
  has_many :wins
  has_many :challenges, :through => :wins
  
  def calculate_score!
    self.update_attribute(:points, self.challenges.to_a.sum(&:points))
  end
  
end
