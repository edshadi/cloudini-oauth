class User < ActiveRecord::Base
  
  def self.create_from_linked_in access_token
    profile = LinkedIn.user_profile access_token
    name = "#{profile["first_name"]} #{profile["last_name"]}"
    self.create :linked_in_token => access_token, :name => name
  end
end
