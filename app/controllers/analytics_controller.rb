#coding: utf-8
require 'nokogiri'
require 'open-uri'
require 'json'
class AnalyticsController < ApplicationController



  def video

    @video = Video.find(params[:id])
    @facebook = @video.facebook
    @celeb = @video.celeb

  end

end
