class Parent < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  before_save :ensure_authentication_token
  validates_confirmation_of :password
  has_attached_file :profile_picture
  scope :verified, -> (verified) { where verified: verified }
  
  def self.search(search)
    if search.blank?
      all
    else
      where('name LIKE ?', "%#{search}%")
    end
  end  
end
