class Sfusers::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def salesforce
    # This is where you process the user information coming back from salesforce.
    logger.info "#{env["omniauth.auth"]["extra"]["display_name"]} just authenticated"
    credentials = env["omniauth.auth"]["credentials"]
    set_session_info(credentials)
    puts "USER USER INFO: #{request.env["omniauth.auth"].to_yaml}"
    @user = Sfuser.find_for_salesforce_oauth(request.env["omniauth.auth"])
    redirect '/sfdemo'
  end

  def auth_hash
    request.env["omniauth.auth"]
  end

  def failure
    super
  end

private

  def set_session_info(credentials)
    session['token'] = credentials["token"]
    session['refresh_token'] = credentials["refresh_token"]
    session['instance_url'] = credentials["instance_url"]
  end

end