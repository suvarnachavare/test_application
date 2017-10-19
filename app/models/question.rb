class Question < ActiveRecord::Base
    has_many :answers
    belongs_to :user

    scope :public_question, lambda{where(private: false )}
end
