class Group < ActiveRecord::Base
  belongs_to :user
  has_many :votes
 	has_many :images

 	mount_uploader :photo, PhotoUploader
end
