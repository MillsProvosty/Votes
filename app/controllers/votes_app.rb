class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/:votable_type/:votable_id/score' do
    scores = Vote.score_for_id_and_type(params)
    VoteSerializer.render(scores, params).to_json
  end

  post '/api/v1/:votable_type/:votable_id/create_vote/:user_token/:rating' do
    Vote.create_vote(params).to_json
  end

  get '/api/v1/Recording/60/update_vote/id/0987asdf/-1' do
    Vote.update_vote(param[:id]).to_json
  end
end
