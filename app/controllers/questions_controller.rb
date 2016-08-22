class QuestionsController < ApplicationController
  #before_action takes in an argument for a method (ideally private) that gets
  # executed just before the action and it's still within the reequest/response
  # cycle
  before_action :find_question, only: [:show, :edit, :update, :destroy]
  # before_action :find_question, except: [:create, :new, :index]
  #GET /questions/new

  #add a before action to check for signed in?
  before_action :authenticate_user!, only: [:create, :edit, :destroy, :update, :new]

  before_action :authorize!, only: [:destroy, :update, :edit]

  QUESTIONS_PER_PAGE = 10

  def new

    #render :new
    #render "/questions/new"

    #We need to instantiate a new Question object because it will help us build
    # a form to create a question easily


    @question = Question.new
  end

  def create



    #we're using the 'strong parameters' feature of Rails here to only allow
    # mass-assigning the attributes that we want to allow the user to set

    # question_params = params.require(:question).permit([:title, :body])
    # flash[:notice] = "Question created successfully!"

    #same as above
    # redirect_to question_path(@question), notice: "Question created successfully"

    @question = Question.create question_params

    @question.user = current_user #already added a helper method to find a user by the session

    if @question.save

      # all the methods below will work to redirect the user:
      # redirect_to question_path({id: @question.id})
      # redirect_to question_path({id: @question})
      redirect_to question_path(@question)
      # redirect_to @question
    else
      flash[:alert] = "Fix below"
      render :new
    end
    # render json: params
  end

  def show
    @answer = Answer.new
    # @question = Question.find(params[:id])

  end

  def index
    @questions = Question.order(created_at: :desc)
    .page(params[:page])
    .per(QUESTIONS_PER_PAGE)
  end

  def edit
    # @question = Question.find(params[:id])
  end

  def update
    # @question = Question.find(params[:id])

    if @question.update question_params
    redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    # question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit([:title, :body])
  end

  def authorize!
    redirect_to root_path, alert: "Access Denied" unless can? :manage, @question
  end
end
