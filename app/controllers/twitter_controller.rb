class TwitterController < ApplicationController
  def recent_tweets
    if current_user
      access_token = prepare_access_token(current_user.token, current_user.secret)
      #response = access_token.request(:get, "http://api.twitter.com/statuses/mentions.json")
      response = access_token.post("http://api.twitter.com/statuses/update", {:status => 'Knock knock knocking on heavens door!!'+Time.now.to_i.to_s})
logger.info response.inspect
      render :json => response.body
    end
  end
  
  private
  
  def prepare_access_token oauth_token, oauth_token_secret
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
