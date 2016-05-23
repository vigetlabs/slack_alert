class HomeController < ApplicationController
  def index
    @button_presses = ButtonPress.order("pushed_at DESC")
  end
end
