require "./spec/rails_helper"
require "./app/controllers/application_controller"

describe "Vote Requests" do
  it "Gets ratings for a specific location" do

    get '/api/v1/Recording/1/recording_rating'

    expect(last_response).to be_successful

    ratings = JSON.parse(last_response.body)

    expect(ratings).to eq("something")
  end
end
