class User < ActiveRecord::Base
	has_many :groups
	has_many :votes

	def self.from_omniauth(auth)
		where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
			user.name = auth.info.name
		end
	end
end
