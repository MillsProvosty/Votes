require './spec/spec_helper'
require './app/models/vote'
require './app/models/application_record'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it {should validate_presence_of :votable_type }
    it {should validate_presence_of :votable_id }
    it {should validate_presence_of :rating }
    it {should validate_presence_of :user_token}
  end
end
