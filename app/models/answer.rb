class Answer < ActiveRecord::Base
    belongs_to :question
    belongs_to :user

     scope :public_question, -> { joins(:question).where("questions.private =false") }
end
