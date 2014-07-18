class User < ActiveRecord::Base
	has_secure_password

	validates :name, presence: true, uniqueness: { case_sensitive: false }

	after_destroy :ensure_an_admin_remains

	private
		def ensure_an_admin_remains
			if User.count.zero?
				raise "Can't delete the last user"
			end
		end
end
