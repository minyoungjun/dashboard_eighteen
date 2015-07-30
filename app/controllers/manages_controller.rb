#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
require 'twitter'

class ManagesController < ApplicationController

  def refresh_facebook

    Video.refresh_facebook
    render :text => "success"

  end

  def refresh_twitter

    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "675AzTJ3pgdFEI7oEmCQreyGc"
      config.consumer_secret     = "BbB3SbRqDZp67IXLCawUUbCftDBXUjC46SwkCSpKLdujavS29b"
      config.access_token        = "3259726897-elUXZk2yZCi9aWFwyELFxDuArpJzGsvaJzCdjS6"
      config.access_token_secret = "Y6JsoQ3c5jckHpoccmYQOuYG1sSLX3hYapSzJfpwzqsWm"
    end

    Clip.where(:source => 2).each do |tweet|

      if tweet.source_id != nil
        tweet.retweet = client.status(tweet.source_id).retweet_count
      else
        tweet.retweet = 0
      end
      tweet.save

    end
    render :text => "success"

  end

  def timing
    
    params[:timing].each do |key, value|
      timing = Timing.find(key)
      timing.snap_id = value
      timing.save
    end

    render :text => "success"

  end

  def login

  end

  def snaplist

    @snapshots = Snap.all
    @timings = Timing.all

  end

  def snapshot
    
    Video.refresh_facebook

    snap = Snap.new
    snap.save
    snap.view = snap.snapshot
    snap.save

    render :text => snap.view.to_s

  end

  def table
    @videos = Video.all
  end

  def update
    params["view"].each do |source, values|
      values.each do |video_id, value|
        video = Video.find(video_id)
        clip = video.source(source)
        if (clip.view < value.to_i) || value.to_i == 1
          clip.view = value.to_i
          clip.save
        end
      end
    end
    redirect_to :action => "table"


  end

  def list
      arr = Array.new
      @doc = JSON.parse(open("https://graph.facebook.com/#{Fbtoken.my_page}/videos?access_token=#{Fbtoken.fresh}").read)["data"]

  end

  def fb_upload

    video = Video.new
    video.title = params[:title]
    video.celeb_id = params[:celeb_id]
    video.thumbnail_from_url params[:picture].to_s
    video.save

    clip = Clip.new
    clip.source = 0
    clip.video_id = video.id
    clip.source_id = params[:source_id]
    clip.save

    redirect_to :action => "video", :id => video.id

  end

  def fb_change

    clip = Clip.find(params[:clip].to_i)
    video = clip.video
    video.celeb_id = params[:celeb_id]
    video.save

    redirect_to :action => "video", :id => video.id

  end

  def video

    @video = Video.find(params[:id])
    @facebook = @video.clips.where(:source => 0).first
    @celeb = @video.celeb

  end

  def twitter

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

    video = Video.find(params[:video])
    clip = video.source(2)
    clip.source_id = params[:source_id]
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
