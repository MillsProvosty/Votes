require "./spec/rails_helper"

describe "Vote Requests" do
  describe "Gets ratings for a specific location" do

    get '/api/v1/Recording/1/recording_rating'

    expect(response).to be_successful

    ratings = JSON.parse(response.body)

    expect(ratings).to eq("something")
  end
end
