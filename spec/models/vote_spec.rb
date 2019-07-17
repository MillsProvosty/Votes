require './spec/rails_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it {should validate_presence_of :votable_type }
    it {should validate_presence_of :votable_id }
    it {should validate_presence_of :rating }
    it {should validate_presence_of :user_token}
  end

  describe 'relationships' do
    
  end
end
