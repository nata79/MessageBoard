require 'spec_helper'

describe BoardAccess::Admin::MessagesController do
  let(:board) { FactoryGirl.create :board }
  let(:members) { 
    1.upto(10).map{ 
      board.members.create!{ |m| 
        m.user = FactoryGirl.create :user
      } 
    } 
  }
  let(:message) { 
    board.messages.create!{ |m| 
      m.board_member = members.first
      m.content = 'This is random text.' 
    }
  }

  context 'Authorization' do
    describe 'DELETE destroy' do
      it 'gives a 401 to a guest' do
        delete :destroy, id: message.id, board_id: board.id
        expect(response.code).to eq '401'
      end

      it 'gives a 401 to user that is not a board member' do
        sign_in FactoryGirl.create(:user)
        delete :destroy, id: message.id, board_id: board.id
        expect(response.code).to eq '401'
      end

      it 'gives a 401 to a member of the board with normal access' do
        sign_in members.first.user
        delete :destroy, id: message.id, board_id: board.id
        expect(response.code).to eq '401'
      end

      it 'gives access to a member of the board with admin access' do
        sign_in board.user
        delete :destroy, id: message.id, board_id: board.id
        expect(response.code).to eq '302'
      end
    end
  end
end