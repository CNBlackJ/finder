class Profile < ApplicationRecord
  belongs_to :user
  validates_presence_of :alt_email
  validates_inclusion_of :sex, in: [0, 1, 2]
  validates_length_of :name, minimum: 2, on: :create
end
