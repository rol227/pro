class Vote < ActiveRecord::Base
  belongs_to :group
  belongs_to :vote
  belongs_to :user
end
