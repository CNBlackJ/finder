require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe '#Validation' do
  	it { should belong_to(:user) }
    it { should validate_presence_of(:alt_email) } 
    it { should validate_length_of(:name).is_at_least(2).on(:create) }
    it { should validate_inclusion_of(:sex).in_array([1, 2, 0]) }
  end

end
