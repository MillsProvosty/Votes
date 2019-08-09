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
    if api_key_valid?
      vote = Vote.check_previous(params)

      json VoteSerializer.new(vote)
    else
      halt 401
    end
  end

  get '/api/v1/:votable_type/:votable_id/update_vote/:id/:user_token/:rating' do
    if api_key_valid?
      updated_vote = Vote.update_vote(params[:id], params[:rating])

      json VoteSerializer.new(updated_vote)
    else
      halt 401
    end
  end

  private

  def api_key_valid?
    ENV['VOTES_API_KEY'] && params[:api_key] == ENV['VOTES_API_KEY']
  end
end
