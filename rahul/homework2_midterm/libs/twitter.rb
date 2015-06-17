require 'oauth'
require 'json'
require 'rest-client'

class Twitter


def initialize(api_key, api_secret)
@api_key = api_key
@api_secret = api_secret
end


# Exchange your oauth_token and oauth_token_secret for an AccessToken instance.
def prepare_access_token(oauth_token, oauth_token_secret)
  # TODO: There has to be a way to encrypt this these OAuth keys...
  consumer = OAuth::Consumer.new("347AlFg7FrJMGgFXXyyzzGNLj", "5mCCuso5XJhVLV6MLRGuzjPoYYRUzbOwfgIfso2ApU1GO7U1Os", { :site => "https://api.twitter.com", :scheme => :header })

  # now create the access token object from passed values
  token_hash = { :oauth_token => oauth_token, :oauth_token_secret => oauth_token_secret }
  access_token = OAuth::AccessToken.from_hash(consumer, token_hash )

  return access_token
end

# Extract the JSON data and return it.
def call
  # Exchange our oauth_token and oauth_token secret for the AccessToken instance.
  access_token = prepare_access_token(@api_key, @api_secret)

  # use the access token as an agent to get the home timeline
  response = access_token.request(:get, "https://api.twitter.com/1.1/statuses/home_timeline.json")
  json_data = JSON.parse(response.body)

end

end