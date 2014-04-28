class WelcomeController < ApplicationController
  def index
  end

  def open_url
    @url = params[:url]

    url = URI.parse(params[:url])
    req = Net::HTTP::Get.new(url.path)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    @res_body =  res.body
    render :index
  end
end
