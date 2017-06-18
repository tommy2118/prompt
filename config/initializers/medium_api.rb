require "net/http"

class MediumAPI

  def self.create_draft_post(user_id, token, title)
    uri = URI.parse("https://api.medium.com")
    uri.path = "/v1/users/#{user_id}/posts"
    req = Net::HTTP::Post.new(uri)
    content = {
      "title" => "Prompts test",
      "contentFormat" => "html",
      "content" => "<h1>Prompts Test</h1>",
      "canonicalUrl" => "",
      "tags" => [],
      "publishStatus" => "draft"
    }

    req.body = JSON.generate(content)
    req["Accept"] = "application/json"
    req["Accept-Charset"] = "utf-8"
    req["Authorization"] = "Bearer #{token}"
    req["Content-Type"] = "application/json"

    res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) { |http|
      http.request(req)
    }

    data = JSON.parse(res.body)
    data['data']['url']
  end
end
