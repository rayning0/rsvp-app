class User < ActiveRecord::Base
  has_many :invites, dependent: :destroy
  has_many :events, through: :invites
end