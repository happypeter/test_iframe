class WelcomeController < ApplicationController
  def index
  end

  def open_url
    @url = params[:url]

    url = URI.parse(params[:url])
    req = Net::HTTP::Get.new(url.path)
    # baidu.com cause error here
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @res_body =  res.body
  end
end
