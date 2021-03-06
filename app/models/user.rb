class User < ActiveRecord::Base

  acts_as_followable
  acts_as_follower

  acts_as_authentic do |c|
    c.login_field :username
    c.validate_password_field = false

  end

  has_many :posts

  end
