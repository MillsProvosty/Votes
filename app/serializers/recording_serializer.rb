class RecordingSerializer
  include FastJsonapi::RecordingSerializer
    attributes :id,
               :title,
               :user_token,
               :landmark,
               :updated_at,
               :created_at
end
