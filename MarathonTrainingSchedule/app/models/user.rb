class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :username

  def self.authenticate(username="", login_password="")
  	# if  EMAIL_REGEX.match(username)    
  	#   user = User.find_by_email(username)
  	# else
  	p "^^^" *100
  	  user = User.find_by_username(username)
  	# end
  	if user && user.match_password(login_password)
  	  return user
  	else
  	  return false
  	end
  end

  def match_password(login_password="")
  	password = login_password
  end

end
