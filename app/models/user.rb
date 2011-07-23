class User < ActiveRecord::Base
  def self.create_with_omniauth auth
    create! do |user| 
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.nickname = auth['user_info']['name']
      user.secret = auth['credentials']['secret']
      user.token = auth['credentials']['token']
    end
  end
  
  
  def self.pep_access_token oauth_token, oauth_token_secret
    consumer = OAuth::Consumer.new(TWITTER_CONSUMER_KEY, TWITTER_SECRET_KEY,
                { :site => TWITTER_API_SITE
                }
               )
    # now create the access token object from passed values
    token_hash = { :oauth_token => oauth_token,
                   :oauth_token_secret => oauth_token_secret
                 }
    access_token = OAuth::AccessToken.from_hash(consumer, token_hash )
    return access_token
  end  

end
