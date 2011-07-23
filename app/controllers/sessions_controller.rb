class SessionsController < ApplicationController
  def create 
    auth = request.env['omniauth.auth']
    #raise auth.to_yaml
    user = User.find_by_provider_and_uid(auth['provider'], auth['uid']) || User.create_with_omniauth(auth)
    session[:user_id] = user.id
    redirect_to root_url, :notice => 'Signed in successfully'
  end
  
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => 'Signed in successfully'
  end
  
  def failure
    redirect_to root_url, :flash => {:error => 'There was an error at the remote authentication service. You have not been signed in.'}
  end
end
