#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
class AnalyticsController < ApplicationController

  def profile
    @celeb = Celeb.find(params[:id])

  end


  def video

    @video = Video.find(params[:id])
    @facebook = @video.facebook
    @celeb = @video.celeb


    @sources = ["facebook", "youtube", "twitter", "naver", "daumkakao", "everyshot"]


  end

end
