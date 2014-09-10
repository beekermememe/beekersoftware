class Sfdemo < ApplicationController
  def oauth

  end

  def sfdemo
    client ||= Force.new instance_url:  session['instance_url'], 
                            oauth_token:   session['token'],
                            refresh_token: session['refresh_token'],
                            client_id:     ENV['SALESFORCE_KEY'],
                            client_secret: ENV['SALESFORCE_SECRET']
    data = client.query("select Id, Name from Account")
    render :json => data.to_json
  end

  def chatter

  end

  def emails

  end

  def upload_emails

  end

  def upload_chatter

  end

end