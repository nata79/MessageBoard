module BoardAccess
  module Admin
    class BoardsController < BaseController
      def destroy
        @board.destroy
        redirect_to redirect_path
      end
    end
  end
end