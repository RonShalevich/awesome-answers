class Answer < ApplicationRecord
  # rails g model answer body:text question:references#
  # this line assumes that the answers table has a field called question_id
  # this gives us a handy method to fetch the associated question with an answer:
  # a = Answer.last
  # q = a.question
  # question is reference to model
  belongs_to :question

  
  validates :body, presence: true, uniqueness: {scope: :question_id}
end
