class TestimonialsController < ApplicationController

  def index
    @user = User.find(params[:user_id])
    @testimonials = Testimonial.where(user_id: @user.id).order(created_at: :desc)
  end

  def create
    @testimonial = Testimonial.new(testimonial_params)
    if @testimonial.save
      redirect_to request.referrer
    else
      redirect_to request.referrer
      @flash = {error:"there is a problem in your submission, please try again"}
    end
  end

  def update
    @testimonial = Testimonial.find(params[:id])
    @testimonial.update(testimonial_params)
    redirect_to request.referrer
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:title, :testimony, :visitor_id, :user_id)
  end
end
