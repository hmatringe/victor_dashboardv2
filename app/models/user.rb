class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :participants, dependent: :destroy
  has_many :projects, dependent: :destroy

  validates :first_name, presence: true
  validates :last_name, presence: true

 	def full_name
 		"#{first_name} #{last_name}"
 	end        

	 def full_name_with_email
 		"#{first_name} #{last_name} - #{email}"
 	end        
end
