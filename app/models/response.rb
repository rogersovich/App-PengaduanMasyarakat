class Response < ApplicationRecord
  belongs_to :complaint_id
  belongs_to :user_id
end
