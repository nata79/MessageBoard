require_relative '../board_access_base_controller.rb'

module BoardAccess
  module Normal
    class BaseController < BoardAccess::BoardAccessBaseController      

    private      
      def grant_access?
        @board.is_member? current_user
      end
    end
  end
end