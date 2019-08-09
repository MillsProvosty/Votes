require 'spec_helper'

RSpec.describe Vote, type: :model do
  describe 'validations' do
    it{should validate_presence_of(:votable_type)}
    it {should validate_presence_of :votable_id }
    it {should validate_presence_of :rating }
    it {should validate_presence_of :user_token}
  end

  describe 'class methods' do
    it "sorts votable_id's by total score" do
      vote1 = Vote.create(votable_type: "recording", votable_id: 12, rating: 1, user_token:
      "ojset0293jhtiuwgrh")
      vote2 = Vote.create(votable_type: "recording", votable_id: 23, rating: -1, user_token:
      "ojset0aoer903uwgrh")

      expected = {
        12 => 1,
        34 => 0,
        23 => -1
      }

      expect(Vote.sort_by_rating("recording", [23, 34, 12])).to eq(expected)
    end
  end
end
