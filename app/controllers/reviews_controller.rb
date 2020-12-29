class ReviewsController < ApplicationController
   
   before_action :set_review, only: [:show, :edit, :update, :destroy]
   before_action :require_user, except: [:show, :index]
   # Important this is after require_user as above code needs to run first
   before_action :require_same_user, only: [:edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.all
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
  end

  # GET /reviews/new
  def new
    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)

    @review.user = current_user
      if @review.save
         flash[:notice] = "Review saved"
         redirect_to review_path(@review)
      else
         render 'new'
      end
  end

  # PATCH/PUT /reviews/1
  def update
    if @review.update(reivew_params)
        flash[:notice] = "Review was updated successfully"
        redirect_to @review
    else
        render 'edit'
    end
  end

  # DELETE /reviews/1
  def destroy
      @article.destroy
      flash[:notice] = "Review successfully deleted"
      redirect_to review_path
  end

  private
   def set_review
      @review = Review.find(params[:id])
   end
   
   def review_params
      params.require(:review).permit(:title, :description)
   end
   
   def require_same_user
      if current_user != @review.user && !current_user.admin?
         flash[:alert] = "Don't be tryin to mess with other peoples' review"
         redirect_to @review
      end
   end
end
