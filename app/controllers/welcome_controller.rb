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

  def page
    @body = "<h1>hello</h2>" + '<button onclick="TogetherJS(this); return false;">Start TogetherJS</button> ' +
    '<script src="https://togetherjs.com/togetherjs-min.js"></script>'
  end
end
