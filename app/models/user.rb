class User < ActiveRecord::Base
	has_many :posts
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
	validates :first_name, presence: true
	validates :last_name, presence: true
	validates :user_name, presence: true
	validates :password, presence: true
	validates :birthdate, presence: true
	validates :user_name, uniqueness: true
	validates :password, length: { in: 8..10 }
	validates :email, uniqueness: true
	# validates :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/

	


end
