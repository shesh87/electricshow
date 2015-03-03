class Post < ActiveRecord::Base
	belongs_to :user
	belongs_to :event

	validates :comments, presence: true
end
