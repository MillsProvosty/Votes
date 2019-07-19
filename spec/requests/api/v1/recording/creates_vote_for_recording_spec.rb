require "./spec/spec_helper"

describe "Create Vote" do
  it "Creates a vote for a recording, with an id, and changes total score" do
    votable_id = 60
    votable_type = 1
    user_token = "19384uksjehf"

    post '/api/v1/recordings/1/create_vote/19384uksjehf'
binding.pry
    expect(last_response).to be_ok

    vote = JSON.parse(last_response.body, symbolize_names: true)
binding.pry
    expect(vote).to eq(1)
    expect(ratings[:data][:attributes][:downvotes]).to eq(2)
    expect(ratings[:data][:attributes][:total_score]).to eq(-1)
  end
end
