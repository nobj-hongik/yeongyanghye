class HomeController < ApplicationController
  def index
    @magazines = Magazine.where(category: 0,is_selected: true).order("sequence asc").all
    @m1 = @magazines.first
    @m2 = @magazines.second
    @m3 = @magazines.third
    @m4 = @magazines.fourth
  end
end
