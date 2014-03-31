class UserSave

  def is_valid_password?(password)
    sha256 = Digest::SHA256.new
    digest = sha256.digest password.to_s
    self.password == digest
  end

  def save(params)
    if self.password.to_s != ""
      if is_valid_password?(params[:password])
        self.name = params[:name] if params.name?
        self.email = params[:email] if params.name?
        self.save!
        true
      else
        false
      end
    else
      digest = sha256.digest params[:password].to_s
      self.password == digest
      self.name = params[:name] if params.name?
      self.email = params[:email] if params.name?
      self.password = digest
      self.save!
      true
    end
  end

  def update_password(oldword,newword)
    if self.password.to_s != ""
      if is_valid_password?(oldword)
        digest = sha256.digest newword.to_s
        self.password == digest
        self.save!
        true
      else
        false
      end
    else
      digest = sha256.digest newword.to_s
      self.password == digest
      self.save!
      true
    end
  end
end
