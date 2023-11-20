class BusinessesController < ApplicationController
  before_action :set_current_user

  def new
    @business = Business.new
    @business_types = %w[Cafe Restaurant Bar]
  end

  def create
    @business = Business.new(business_params)
    if @business.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end

    if @business.user_assigned?
      create_business_user_relationship(@current_user, @business, 'Admin')
    end

  end

  private

  def set_current_user
    auth0_aud = session[:userinfo]['aud']
    @current_user = User.find_by(auth0_id: auth0_aud)
  end

  def business_params
    params.require(:business).permit(:name, :location, :address, :business_type, :user_assigned)
  end

  def create_business_user_relationship(user, business, role)
    @business_user_relationship = BusinessUserRelationship.new
    @business_user_relationship.user_id = user.id
    @business_user_relationship.business_id = business.id
    @business_user_relationship.role = role
    @business_user_relationship.save
  end

end
