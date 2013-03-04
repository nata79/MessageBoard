require_relative '../board_access_base_controller.rb'

module BoardAccess
  module Admin
    class BaseController < BoardAccess::BoardAccessBaseController
      def destroy
        @board.destroy
        redirect_to redirect_path
      end
    private
      def authenticate_user!
        permission_denied unless user_signed_in?
      end      

      def grant_access?
        @board.is_admin? current_user
      end      
    end
  end
end