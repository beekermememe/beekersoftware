class Sfuser < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_for_salesforce_oauth(credentials)
    user = Sfuser.where( uid: credentials["extra"]["user_id"]).first rescue nil
    unless user
      user = Sfuser.create!(
        uid: credentials["extra"]["user_id"],
        email: credentials["info"]["email"],
        password: Devise.friendly_token[0,20],
        name: "#{credentials["info"]["first_name"]} #{credentials["info"]["last_name"]}"
      )
    end
    user
  end
end
