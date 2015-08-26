class DbbackupController < ApplicationController
  def index
    @timings = Timing.all
    @celebs = Celeb.all
  end
end
