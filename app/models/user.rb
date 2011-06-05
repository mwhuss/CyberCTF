class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :handle
  
  validates_uniqueness_of :handle
  
  has_many :wins
  has_many :challenges, :through => :wins, :uniq => true
  
  def calculate_score!
    self.update_attribute(:points, self.challenges.to_a.sum(&:points))
  end
  
  def email_required?
    false
  end
  
end
