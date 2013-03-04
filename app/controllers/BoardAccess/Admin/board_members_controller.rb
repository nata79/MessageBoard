module BoardAccess
  module Admin
    class BoardMembersController < BaseController
      def create
        redirect_to redirect_path
      end
    end
  end
end