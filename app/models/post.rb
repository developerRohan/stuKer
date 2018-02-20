class Post < ApplicationRecord
	belongs_to :user
	validates :content , presence:true
	validates :scheduled_at , presence:true
	validates_length_of :content ,maximum: 140, notice: 'not more than 140 charactersd are allowed !'
	validates_datetime :scheduled_at, :on => :create , :on_or_after => Time.zone.now


	def to_twitter
		client = Twitter::REST::Client.new do |config|
  			config.consumer_key        = self.user.twitter.oauth_token
  			config.consumer_secret     = self.user.twitter.secret
  			config.access_token        = ENV['TWITTER_KEY']
  			config.access_token_secret = ENV['TWITTER_SECRET']
		end
		client.update(self.content)
	end

	def to_facebook
		graph = Koala::Facebook::API.new(self.user.facebook.oauth_token)
		graph.put_connections("me","feed",message: self.content)
	end
end
