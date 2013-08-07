class App < ActiveRecord::Base
  belongs_to :reviewer, class_name: User, foreign_key: :reviewer_id
  belongs_to :applicant, class_name: User, foreign_key: :applicant_id

  has_many :answers
  has_many :comments
end
