require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/contrib'

class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/:votable_type/:votable_id/score' do
    scores = Vote.score_for_id_and_type(params)

    json ScoreSerializer.render(scores, params)
  end

  post '/api/v1/:votable_type/:votable_id/create_vote/:user_token/:rating' do
    vote = Vote.create_vote(params)
    json VoteSerializer.new(vote)
  end

  get '/api/v1/:votable_type/:votable_id/update_vote/:id/:user_token/:rating' do
    updated_vote = Vote.update_vote(params[:id], params[:rating])

    json VoteSerializer.new(updated_vote)
  end
end
