class SizesController < ApplicationController
  def index
    @size = Size.all
  end
end
