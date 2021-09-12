class ApplicationController < ActionController::Base

  # any method here will be available for all controllers

  # ana ba7ot el satr dh to say en el method dyh kaman mmkn asta5demha as a helper function in my views
  helper_method :current_user, :logged_in?

  # ana shelt el method dyh mn el helper file and i've put it here to be able to use it in all controllers
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
    # to do so just put the '!!' before the method name
    # y3ny mn el a5er lw fyh current user hatraga3 true, else hatraga3 false
    !!current_user
  end

end
