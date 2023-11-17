class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
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
    @profile = Profile.new(profile_params)
    @profile.user_id = session[:userinfo]['aud']
    if @profile.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :location, :dietary_preferences)
  end
end
