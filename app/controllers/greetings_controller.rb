class GreetingsController < ApplicationController
  def index
    @random = "https://source.unsplash.com/random"
    @photos = random
  end

  # ９０枚の検索結果を取得
  def search
    @photos = []
    3.times do |i|
      search_results = Unsplash::Photo.search(params[:keyword], page = (i+1), per_page = 30)
      search_results.each do |photo|
        @photos << photo
      end
    end
    @photos = random if @photos.size == 0
  end

  def random
    photos = []
    3.times do |i|
      search_results = Unsplash::Photo.random(count: 30)
      search_results.each do |photo|
        photos << photo
      end
    end
    return photos
    
  end

  Unsplash.configure do |config|
    config.application_access_key = ENV["UNSPLASH_APPLICATION_ACCESS_KEY"]
    config.application_secret = ENV["UNSPLASH_APPLICATION_SECRET"]
    config.application_redirect_uri = "https://your-application.com/oauth/callback"
    config.utm_source = "image-falling-app"
  end
end
