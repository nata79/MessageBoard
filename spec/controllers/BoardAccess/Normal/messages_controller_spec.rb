require 'spec_helper'

describe BoardAccess::Normal::MessagesController do
  let(:board) { FactoryGirl.create :board }
  let(:members) { 
    1.upto(10).map{ 
      board.members.create!{ |m| 
        m.user = FactoryGirl.create :user
      } 
    } 
  }
  let(:params) { 
    { 
      board_id: board.id,
      message: { content: 'This is random text.' } 
    } 
  }

  context 'Authorization' do
    describe 'POST create' do
      it 'gives a 401 to a guest' do
        post :create, params
        expect(response.code).to eq '401'
      end

      it 'gives a 401 to user that is not a board member' do
        sign_in FactoryGirl.create(:user)
        post :create, params
        expect(response.code).to eq '401'
      end

      it 'gives access to a member of the board with normal access' do
        sign_in members.first.user
        post :create, params
        expect(response.code).to eq '302'
      end

      it 'gives access to a member of the board with admin access' do
        sign_in board.user
        post :create, params
        expect(response.code).to eq '302'
      end
    end
  end

  context 'Functionality' do
    before { sign_in members.first.user }

    describe 'POST create' do
      it 'posts a message to the board' do
        count = board.messages.count
        post :create, params
        expect(board.messages.count).to eq (count + 1)
      end
    end
  end
end