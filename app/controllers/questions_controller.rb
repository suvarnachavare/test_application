class QuestionsController < ApplicationController
   def index
    question = params[:query] ? Question.public_question.where("title like ?", "%#{params[:query]}%") : Question.public_question.all
    @questions = question.to_json(include: { answers: { only: :answers } } )
    respond_to do |format|
      format.json { render json: @questions }
    end
   end

  def show
    question = Question.public_question.find(params[:id])
    @question = question.to_json(include: { answers: { only: :answers} } )
   respond_to do |format|
      format.json { render json: @question }
    end
  end
end
