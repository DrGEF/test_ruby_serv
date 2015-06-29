class User < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true
  	has_secure_password

  	after_destroy :admin_remain

  	private

  	def admin_remain
  		if User.count.zero?
  			raise "Последний пользователь не может быть удален!"
  		end
  		
  	end
end
