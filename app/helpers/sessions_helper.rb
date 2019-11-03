module SessionsHelper
	def current_user
		if session[:user_id]
			current_user = User.find_by(id: session[:user_id])
		elsif cookies[:user_id]
			user = User.find_by(id: cookies[:user_id])
			if user
				remember_token = cookies[:remember_token]
				remember_digest = user.remember_digest
				user_authenticated = Bcrypt::Password.new(remember_digest).is_password?(remember_token)
				if user_authenticated
					log_in user
					current_user = user
				end
			end
		end	
	end

	def log_in(user)
		session[:user_id] = user.id
	end

	def session_en_cours?
		(session[:user_id].nil?)? (return false) : (return true)
	end

	def is_owner?(id)
		(current_user.id == id)? (return true) : (return false)
	end

	def remember(user)
		remember_token = SecureRandom.urlsafe_base64
		user.remember(remember_token)
		cookies.permanent[:user_id] = user.id
		cookies.permanent[:remember_token] = remember_token
	end

	def log_out(user)
		session.delete(:user_id)
		forget(user)
	end

	def logged_in?
		return false if session[:user_id].nil?
		return true
	end

	def forget(user)
		user.update(remember_digest: nil)
		cookies.delete(:user_id)
		cookies.delete(:remember_token)
	end
end
