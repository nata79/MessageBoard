module BoardAccess
  module Admin
    class MessagesController < BaseController
      before_filter :load_message

      def destroy
        @message.destroy
        redirect_to redirect_path
      end
    private
      def load_message
        @message = @board.messages.find params[:id]
      end
    end
  end
end