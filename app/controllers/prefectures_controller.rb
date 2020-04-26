class PrefecturesController < ApplicationController

  # def hokkaido
  #   @posts = Post.all
  # end

  # def tohoku

  # end

  # def kanto

  # end

  # def chubu
    
  # end

  # def kinki
    
  # end

  # def chugoku
    
  # end

  # def shikoku
    
  # end

  # def kyushu
    
  # end

  # def okinawa
    
  # end
  
  private
  def set_postBox
    @posts = Post.all
  end
end
