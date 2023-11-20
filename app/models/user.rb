class User < ApplicationRecord
  has_many :business_user_relationships, dependent: :destroy
end
