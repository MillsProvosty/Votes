class Vote < ActiveRecord::Base
  validates_presence_of :votable_type,
                        :votable_id,
                        :rating,
                        :user_token

  enum votable_type: ["landmark", "recording", "tour"]

  def self.check_previous(params)
    params.delete('api_key')
    votable_id = params["votable_id"]
    user_token = params["user_token"]
    votable_type = params["votable_type"]

    # new_rating = params[:rating]
    # vote = self.find_or_create_by!(votable_id: votable_id, votable_type: votable_type, user_token: user_token)
    # vote.update!(rating: new_rating)
    vote_id = select("votes.*").where(user_token: user_token, votable_id: votable_id, votable_type: votable_type)

    if vote_id.count == 0
      Vote.create(params)
    else
      old_vote_id = vote_id.first[:id]
      new_rating = params[:rating]
      self.update_vote(old_vote_id, new_rating)
    end
  end

  def self.score_for_id_and_type(attributes)
    upvotes = relevant_votes(attributes[:votable_id], attributes[:votable_type]).where(rating: 1).count
    downvotes = relevant_votes(attributes[:votable_id], attributes[:votable_type]).where(rating: -1).count

    {upvotes: upvotes, downvotes: downvotes}
  end

  def self.relevant_votes(votable_id, votable_type)
    self.where(votable_type: votable_type, votable_id: votable_id)
  end

  def self.update_vote(vote_id, rating)
    vote = Vote.find(vote_id)
    vote[:rating] = rating
    vote.save
    return vote
  end

  def self.sort_by_rating(votable_type, array_of_ids)
    array_of_ids.each do |id|
      unless self.find_by(id: id)
        self.create!(votable_id: id, votable_type: votable_type, rating: 0, user_token: "blar")
      end
    end

    sorted_collection =
    self.where(votable_type: votable_type, votable_id: array_of_ids)
      .select("sum(rating) as total_score", :votable_id)
      .group(:votable_id)
      .order(total_score: :desc)

    hash = {}
    sorted_collection.each do |votable_object|
      hash[votable_object.votable_id] = votable_object.total_score
    end
    hash
  end
end
