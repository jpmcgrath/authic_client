class User < ActiveRecord::Base
  include AuthicUserMixin
  # attr_accessible :title, :body
end
