require "./spec/spec_helper"

describe "Vote Requests" do
  it "Returns the votes sorted by rating" do
    vote1 = Vote.create(votable_type: "recording", votable_id: 12, rating: 1, user_token:
    "ojset0293jhtiuwgrh")
    vote2 = Vote.create(votable_type: "recording", votable_id: 23, rating: -1, user_token:
    "ojset0aoer903uwgrh")


    get "/api/v1/sort_by_rating/recording?ids[]=23&ids[]=34&ids[]=12"

    expect(last_response).to be_successful

    sorted = JSON.parse(last_response.body)

    expected = {
      "12"=>1,
      "34"=>0,
      "23"=>-1
    }

    expect(sorted).to eq(expected)
  end
end
