class TestimonialsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
  end

  def create
    @testimonial = Testimonial.new(testimnial_params)
    if @testimonial.save
      redirect_to user_testimonials_path(params[:user_id])
    else
      redirect_to user_testimonials_path(params[:user_id])
      @flash = {error:"there is a problem in your submission, please try again"}
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    @testimonial.update(testimonial_params)
    redirect_to user_testimonials_path(params[:user_id])
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:title, :testimony, :visitor_id, :user_id)
  end
end
