class PrefecturesController < ApplicationController

  # def hokkaido
  #   @messages = Message.all
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
  def set_messageBox
    @messages = Message.all
  end
end
