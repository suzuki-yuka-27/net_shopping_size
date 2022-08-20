class TopsController < ApplicationController
  def new
    @top = Top.new
  end
end
