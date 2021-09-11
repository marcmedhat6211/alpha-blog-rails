module ApplicationHelper

  def gravatar_for(user, options = { size: 80 })
    email_address = user.email.downcase
    hash = Digest::MD5.hexdigest(email_address)
    size = options[:size]
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: "rounded shadow mx-auto d-block")
  end

  def current_user
    # here we're doing something called memoization
    # memoization ma3naha en msln fel case dyh, kol mara hab2a me7tag 7aga tgebly el current user hadtar 
    # a3mel query fel database 3ashan tgebly el current user
    # now memoization means en ana ha3mel object haygyb el current user mara wa7da
    # w lw el method dyh is needed one mara tanya it'll just return the object that is already created
    # to use this in rails you use the ||= operator
    @current_user ||= User.find(session[:user_id]) if session[:user_id]     
  end

  def logged_in?
    # hena ana ba7awel el current user method to a boolean method
    # y3ny mn el a5er lw fyh current user hatraga3 true, else hatraga3 false
    !!current_user
  end

end
