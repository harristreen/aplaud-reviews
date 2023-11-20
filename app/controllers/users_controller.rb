class UsersController < ApplicationController
  def new
    @user = User.new
    @dietary_requirements = {
      none: 'None',
      vegetarian: 'Vegetarian',
      vegan: 'Vegan',
      dairy_free: 'Dairy-Free',
      ceoliac: 'Ceoliac',
      gluten_free: 'Gluten-Free',
      halal: 'Halal',
      kosher: 'Kosher',
      nut_allergies: 'Nut Allergies',
      seafood_allergies: 'Seafood Allergies',
      other: 'Other'
    }
  end

  def create
    @user = User.new(user_params)
    @user.auth0_id = session[:userinfo]['aud']
    if @user.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def set_current_user
    auth0_aud = session[:userinfo]['aud']
    @current_user = User.where(auth0_id: auth0_aud)
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :location, :dietary_preferences)
  end
end
