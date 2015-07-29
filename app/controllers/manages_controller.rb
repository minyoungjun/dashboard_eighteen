#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'

class ManagesController < ApplicationController

  def list
      arr = Array.new
      @doc = JSON.parse(open("https://graph.facebook.com/#{Fbtoken.my_page}/videos?access_token=#{Fbtoken.fresh}").read)["data"]

  end

  def fb_upload

    video = Video.new
    video.title = params[:title]
    video.celeb_id = params[:celeb_id]
    video.save


    clip = Clip.new
    clip.source = 0
    clip.video_id = video.id
    clip.source_id = params[:source_id]
    clip.save

    redirect_to :action => "video", :id => video.id

  end

  def video

    @video = Video.find(params[:id])
    @facebook = @video.clips.where(:source => 0).first
    @celeb = @video.celeb

  end

  def twitter
    require 'twitter'

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "675AzTJ3pgdFEI7oEmCQreyGc"
      config.consumer_secret     = "BbB3SbRqDZp67IXLCawUUbCftDBXUjC46SwkCSpKLdujavS29b"
      config.access_token        = "3259726897-elUXZk2yZCi9aWFwyELFxDuArpJzGsvaJzCdjS6"
      config.access_token_secret = "Y6JsoQ3c5jckHpoccmYQOuYG1sSLX3hYapSzJfpwzqsWm"
    end

    @tweets = Array.new

    client.user_timeline(3259726897, {exclude_replies: 1}).each do |tweet|
      if Clip.where(:source_id => tweet.id).count == 0
        @tweets << [ tweet.id, tweet.text ]
      end
    end
  end

  def tweet_upload

    clip = Clip.new
    clip.source = 2
    clip.source_id = params[:source_id]
    clip.video_id = params[:video]
    clip.save

    redirect_to :action => "video", :id => clip.video_id

  end

  def delete_tweet
    clip = Clip.new
    clip.not_video = true
    clip.source_id = params[:id]
    clip.save

    redirect_to :action => "twitter"

  end

end
