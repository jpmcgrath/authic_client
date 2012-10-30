module AuthicUserMixin
  extend ActiveSupport::Concern
  
  def self.included(base)
    base.extend(ClassMethods)
  end

  module ClassMethods
    def find_for_authic_oauth(auth, signed_in_resource=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      return user if user
      create! do |new_user|  
        new_user.provider = auth.provider
        new_user.uid = auth.uid
        new_user.email = auth.info.email
      end
    end
  end
end