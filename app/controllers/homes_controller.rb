class HomesController < ApplicationController
  def top
    @category1 = Category.find(1)
    @category2 = Category.find(2)
    @category3 = Category.find(3)
    @category4 = Category.find(4)
    @category5 = Category.find(5)
    @category13 = Category.find(13)
    @category18 = Category.find(18)
    @category23 = Category.find(23)
    @category17 = Category.find(17)
    @category16 = Category.find(16)
  end

  def about
  end
end
