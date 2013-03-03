module BoardAccess
  module Normal
    class BaseController < ApplicationController
      before_filter :authenticate_user!
      before_filter :load_board
      before_filter :control_access!

    private
      def authenticate_user!
        permission_denied unless user_signed_in?
      end

      def load_board
        id = if params[:board_id]
          params[:board_id]
        else
          params[:id]
        end
        @board = Board.find id
      end

      def control_access!
        permission_denied unless @board.is_member? current_user
      end

      def redirect_path
        board_path @board
      end
    end
  end
end