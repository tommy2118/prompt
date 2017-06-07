require "omniauth-oauth2"

class OmniAuth::Strategies::Medium < OmniAuth::Strategies::OAuth2
  option :client_options,
    site: "https://api.medium.com/v1",
    authorize_url: "https://medium.com/m/oauth/authorize",
    token_url: "https://api.medium.com/v1/tokens"

  option :authorize_options, [:scope]
  option :scope, "basicProfile,publishPost"

  info do
    @info ||= access_token.get("me").parsed["data"]
  end

  uid do
    info["id"]
  end
end
