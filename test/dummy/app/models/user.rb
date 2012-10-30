class User < ActiveRecord::Base
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :remember_me
  include AuthicUserMixin
  # attr_accessible :title, :body
end
