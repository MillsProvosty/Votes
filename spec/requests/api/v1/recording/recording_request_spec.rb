require "./spec/spec_helper"
# require "./app/controllers/application_controller"

describe "Vote Requests" do
  it "Gets a specific recording by id" do

    get '/api/v1/recording/:id/'

    expect(last_response).to be_ok

    ratings = JSON.parse(last_response.body, symbolize_name: true)
binding.pry
    expect(ratings).to eq("something")
  end
end
