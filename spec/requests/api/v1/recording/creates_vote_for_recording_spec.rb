require "./spec/spec_helper"

describe "Create recording Vote" do
  it "Creates a vote for a recording, with an id, and changes total score" do

    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "12049oOwjhsfe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "348205whfna23afe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "348205okadefe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "84jwer2ordafe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "5482adfjq3r8fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "1482adfjq3r8fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: -1, user_token: "3432ih5v3r3r8fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "12cnrufjq3r8fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "190urke8fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "nfje284448fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "9283kjf8fe")
    Vote.create(votable_id: 60, votable_type: "recording", rating: 1, user_token: "0i21keuhr3r8fe")

    get '/api/v1/recording/60/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)

    expect(ratings[:data][:attributes][:upvotes]).to eq(11)
    expect(ratings[:data][:attributes][:downvotes]).to eq(1)
    expect(ratings[:data][:attributes][:total_score]).to eq(10)

    post "/api/v1/recording/60/create_vote/19384uksjehf/-1?api_key=#{ENV['VOTES_API_KEY']}"
    expect(last_response).to be_ok

    vote = JSON.parse(last_response.body, symbolize_names: true)

    expect(vote[:data][:attributes][:votable_id]).to eq(60)
    expect(vote[:data][:attributes][:rating]).to eq(-1)
    expect(vote[:data][:attributes][:user_token]).to eq("19384uksjehf")
    expect(vote[:data][:attributes][:votable_type]).to eq("recording")

    expect(Vote.last.rating).to eq(-1)
    get '/api/v1/recording/60/score'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_names: true)
    expect(ratings[:data][:attributes][:upvotes]).to eq(11)
    expect(ratings[:data][:attributes][:downvotes]).to eq(2)
    expect(ratings[:data][:attributes][:total_score]).to eq(9)
  end

  it 'will not allow vote to be created without valid API key' do
    votable_type = 'recording'
    votable_id = 25

    expect(Vote.relevant_votes(votable_id, votable_type).count).to eq(0)

    post "/api/v1/#{votable_type}/#{votable_id}/create_vote/1234/-1?api_key=#{ENV['VOTES_API_KEY']}"
    expect(last_response.status).to eq(200)
    expect(Vote.relevant_votes(votable_id, votable_type).count).to eq(1)

    post "/api/v1/#{votable_type}/#{votable_id}/create_vote/5678/-1?api_key=not_a_real_api_key"
    expect(last_response.status).to eq(401)
    expect(Vote.relevant_votes(votable_id, votable_type).count).to eq(1)
    
    post "/api/v1/#{votable_type}/#{votable_id}/create_vote/9101112/-1"
    expect(last_response.status).to eq(401)
    expect(Vote.relevant_votes(votable_id, votable_type).count).to eq(1)
  end
end
