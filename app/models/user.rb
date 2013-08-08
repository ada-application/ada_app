class User < ActiveRecord::Base
  rolify
  devise :database_authenticatable, :omniauthable, :omniauth_providers => [:github] 
  
  has_many :review_apps, foreign_key: :reviewer_id
  has_many :apps, foreign_key: :applicant_id

  after_create :assign_default_role

  def self.find_for_github_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    unless user
      user = User.create(name:auth.extra.raw_info.name,
                           provider:auth.provider,
                           uid:auth.uid,
                           email:auth.info.email,
                           encrypted_password:auth.credentials.token#,
                           #github_token: auth.access_token,
                           #github_username: auth.extra.raw_info.login
                           )
    end
    user
  end

  def self.new_with_session(params, session)
    super.tap do |user|
      if data = session["devise.github_data"] && session["devise.github_data"]["extra"]["raw_info"]
        user.email = data["email"] if user.email.blank?
      end
    end
  end

  def not_student?
    has_role?(:admin) || has_role?(:vip)
  end

private
  def assign_default_role
    add_role(:user)
    add_role(:admin) if ['renee@nird.us', 'vegan.bookis@gmail.com', 'elise.worthy@gmail.com'].include? email 
  end

end
