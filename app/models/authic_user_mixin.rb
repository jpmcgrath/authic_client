module AuthicUserMixin
  extend ActiveSupport::Concern
  
  def self.included(base)
    base.extend(ClassMethods)
    base.extend(InstanceMethods)
  end

  module ClassMethods
    def find_for_authic_oauth(auth, signed_in_resource=nil)
      user = User.where(:provider => auth.provider, :uid => auth.uid).first
      user = User.new unless user
      
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.first_name = auth.info.first_name
      user.last_name = auth.info.last_name
      user.full_name = auth.info.full_name
      user.mobile = auth.info.mobile
      user.phone = auth.info.phone
      user.birth_date = auth.info.birth_date
      user.groups = (auth.info.groups.join(",") if auth.info.groups)
      user.roles = (auth.info.roles.join(",")  if auth.info.roles)
      user.authic_data = (auth.extra.raw_info.to_json.to_s if auth.extra.raw_info)
      
      user.save
      return users
    end
  end
  
  module InstanceMethods
    def in_group(group_name)
      self.groups.include? group_name
    end
    
    def groups
      groups_string = self.read_attribute(:groups)
      groups_string.blank? ? [] : groups_string.split(",")
    end
    
    def has_role(role_name)
      self.roles.include? role_name
    end
    
    def roles
      roles_string = self.read_attribute(:roles)
      roles_string.blank? ? [] : roles_string.split(",")
    end
    
    def authic_data
      authic_data_string = self.read_attribute(:authic_data)
      authic_data_string.blank? ? {} : JSON.load(authic_data_string)
    end
    
  end
end