require "./spec/spec_helper"

describe "Allows a user to update a vote" do
  it "and this changes total score" do

    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "12049oOwjhsfe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "348205whfna23afe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "348205okadefe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "84jwer2ordafe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "5482adfjq3r8fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "1482adfjq3r8fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: -1, user_token: "3432ih5v3r3r8fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "12cnrufjq3r8fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "190urke8fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "nfje284448fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "9283kjf8fe")
    Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "0i21keuhr3r8fe")
    the_vote = Vote.create(votable_id: 60, votable_type: "Recording", rating: 1, user_token: "0987asdf")

    id = the_vote.id

    get '/api/v1/Recording/60/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(12)
    expect(ratings[:data][:attributes][:downvotes]).to eq(1)
    expect(ratings[:data][:attributes][:total_score]).to eq(11)

    get '/api/v1/Recording/60/update_vote/id/0987asdf/-1'

    expect(last_response).to be_ok

    vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(vote[:created_at].class).to eq(String)
    expect(vote[:votable_id]).to eq(60)
    expect(vote[:rating]).to eq(-1)
    expect(vote[:user_token]).to eq("19384uksjehf")
    expect(vote[:votable_type]).to eq("Recording")
    get '/api/v1/Recording/60/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(11)
    expect(ratings[:data][:attributes][:downvotes]).to eq(2)
    expect(ratings[:data][:attributes][:total_score]).to eq(9)
  end
end
