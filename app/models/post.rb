class Post < ApplicationRecord
	belongs_to :user
	validates :content , presence:true
	validates :scheduled_at , presence:true
	validates_length_of :content ,maximum: 140, notice: 'not more than 140 charactersd are allowed !'

end
