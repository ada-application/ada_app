class Answer < ActiveRecord::Base
  belongs_to :app
  belongs_to :question
end
