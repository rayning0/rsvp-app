class Event < ActiveRecord::Base
  has_many :invites, dependent: :destroy
  has_many :users, through: :invites
end