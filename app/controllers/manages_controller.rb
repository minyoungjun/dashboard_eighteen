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
    @facebook = 
    @celeb = @video.celeb

  end
end
