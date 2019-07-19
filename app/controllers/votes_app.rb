class VotesApp < Sinatra::Base
  set :root, File.expand_path("..",__dir__)

  get '/api/v1/recordings/:id/score' do
    # recording = VoteSerializer.new(Vote.score_for_recording_id(params[:id]))
    scores = Vote.score_for_id_and_type(params[:id], "Recording")
    VoteSerializer.render(scores, params[:id], "Recording").to_json
  end

  get '/api/v1/landmarks/:id/score' do
    scores = Vote.score_for_id_and_type(params[:id], "Landmark")
    VoteSerializer.render(scores, params[:id], "Landmark").to_json
  end
end
