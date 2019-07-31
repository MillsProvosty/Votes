require "./spec/spec_helper"

describe "Allows a user to update a vote" do
  it "and this changes total score" do

    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "12049oOwjhsfe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "348205whfna23afe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "348205okadefe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "84jwer2ordafe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "5482adfjq3r8fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "1482adfjq3r8fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: -1, user_token: "3432ih5v3r3r8fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "12cnrufjq3r8fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "190urke8fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "nfje284448fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "9283kjf8fe")
    Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "0i21keuhr3r8fe")
    id = Vote.create(votable_id: 78, votable_type: "tour", rating: 1, user_token: "0987asdf").id

    get '/api/v1/tour/78/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(12)
    expect(ratings[:data][:attributes][:downvotes]).to eq(1)
    expect(ratings[:data][:attributes][:total_score]).to eq(11)

    get "/api/v1/tour/78/update_vote/#{id}/0987asdf/-1"

    expect(last_response).to be_ok

    vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(vote[:data][:attributes][:rating]).to eq(-1)

    get '/api/v1/tour/78/score'

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(11)
    expect(ratings[:data][:attributes][:downvotes]).to eq(2)
    expect(ratings[:data][:attributes][:total_score]).to eq(9)
  end
end
