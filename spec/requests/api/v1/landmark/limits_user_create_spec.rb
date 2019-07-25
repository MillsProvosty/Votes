require "./spec/spec_helper"

describe "User can only vote once" do
  it "then update is called" do
    Vote.create(votable_id: 22, votable_type: "recording", rating: -1, user_token: "12345")


    post '/api/v1/landmark/22/create_vote/12345/-1'
    
    expect
  end
end
