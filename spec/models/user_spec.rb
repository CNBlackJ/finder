require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#Validation' do
  	it { should have_one(:profile)}
    it { should validate_presence_of(:nick_name) }
    it { should validate_presence_of(:password) }
    it { should validate_presence_of(:email) }
  end
end
