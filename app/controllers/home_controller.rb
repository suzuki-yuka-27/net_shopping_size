class HomeController < ApplicationController
  def index
    @top = User.find(current_user.id).top
    @bottom = User.find(current_user.id).bottom
    @one_piece = User.find(current_user.id).one_piece
    @outer = User.find(current_user.id).outer
    @hat = User.find(current_user.id).hat
    @ring = User.find(current_user.id).ring
    @underwear = User.find(current_user.id).underwear
  end
end
