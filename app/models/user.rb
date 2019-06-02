class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable
         has_many :products, dependent: :destroy
         has_many :comments, dependent: :destroy
         has_one :shop, dependent: :destroy
	has_many :registeration_numbers
  acts_as_commontator
  ratyrate_rater
  
  def is_agent?
  	self.role == "agent"
  end
	rails_admin do
		create do 
			field :email
			field :password
		  field :role , :enum do
		    enum do
		      [['Agent','agent'],['User','user']]
		    end
		  end 
		end
		update do 
			field :email
			field :password
		  field :role , :enum do
		    enum do
		      [['Agent','agent'],['User','user']]
		    end
		  end 
		end
  end

      def self.find_for_facebook_oauth(auth)
     user = User.where(email: auth.info.email).first
     if user
      return user
    else
      where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
       u.name = auth.info.name
       u.provider = auth.provider
       u.uid = auth.uid
       u.email = auth.info.email
       u.image = auth.info.image
       u.password = Devise.friendly_token[0,20]
       u.email_confirmed = true
       u.save
       MyMailer.delay.after_accountconfirm(u)
     end
   end
  end





  def self.find_for_google_oauth2(auth, signed_in_resourse=nil)
   user = User.where(email: auth.info.email).first

   if user
    return user
  else
    where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
     u.name = auth.info.name
     u.provider = auth.provider
     u.uid = auth.uid
     u.email = auth.info.email
     u.image = auth.info.image
     u.password = Devise.friendly_token[0,20]
     u.email_confirmed = true
     u.save
    MyMailer.delay.after_accountconfirm(u)
   end
  end
  end




  def self.find_for_twitter_oauth(auth, signed_in_resource=nil)
    user = User.where(:provider => auth.provider, :uid => auth.uid).first
    if user
      return user
    else
      registered_user = User.where(:email => auth.uid + "@twitter.com").first
      if registered_user
        return registered_user
      else
        user = User.create(name:auth.info.name,
          provider:auth.provider,
          uid:auth.uid,
          email:auth.uid+"@twitter.com",
          image:auth.info.image,
          password:Devise.friendly_token[0,20],
          email_confirmed:true
          )
       MyMailer.delay.after_accountconfirm(user)

      end
    end
  end
end
