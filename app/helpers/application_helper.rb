module ApplicationHelper
  def show_m1_bg
   if @m1.present?
     "background-image: url(#{@m1.image});"
   end
  end
  def show_m2_bg
   if @m2.present?
     "background-image: url(#{@m2.image});"
   end
  end
  def show_m3_bg
   if @m3.present?
     "background-image: url(#{@m3.image});"
   end
  end
  def show_m4_bg
   if @m4.present?
     "background-image: url(#{@m4.image});"
   end
  end
end
