class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/:votable_type/:votable_id/score' do
    scores = Vote.score_for_id_and_type(params)

    json VoteSerializer.render(scores, params)
  end

  post '/api/v1/:votable_type/:votable_id/create_vote/:user_token/:rating' do
    Vote.create_vote(params)
    json {message: "It booped the bop."}
  end

  get '/api/v1/:votable_type/:votable_id/update_vote/:id/:user_token/:rating' do
    Vote.update_vote(params[:id], params[:rating])
    json {message: "It bopped the boop."}
  end
end
