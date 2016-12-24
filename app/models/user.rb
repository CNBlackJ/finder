class User < ApplicationRecord
  has_one :profile
  validates_presence_of :nick_name, :password, :email
  binding.pry

  HardWorker.perform_at('zhang', 5)
end
