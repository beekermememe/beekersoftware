class SfdemoController < ApplicationController
  def oauth

  end

  def sfdemo
    client ||= Force.new(instance_url: session['instance_url'],oauth_token: session['token'])
    data = client.describe
    binding.pry
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