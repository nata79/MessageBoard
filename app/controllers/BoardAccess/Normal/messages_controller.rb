module BoardAccess
  module Normal
    class MessagesController < BaseController
      def create
        @message = @board.messages.create!(params[:message]){ |m|
          m.board_member = @board.member_from_user current_user
        }
        redirect_to redirect_path
      end
    end
  end
end