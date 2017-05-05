class User < ActiveRecord::Base
 validates :name, presence: true, uniqueness: true
 has_secure_password
 validates :password, presence: true, length: {minimum: 6}, allow_nil: true
 after_destroy :ensure_an_admin_remains

 private 
  def ensure_an_admin_remains
  	if User.count.zero?
  		raise "Can't delete user"
  	end
 end

end
