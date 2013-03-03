require 'spec_helper'

describe BoardAccess::Normal::BoardsController do
  let(:board) { FactoryGirl.create :board }
  let(:members) { 
    1.upto(10).map{ 
      board.members.create!{ |m| 
        m.user = FactoryGirl.create :user
      } 
    } 
  }

  describe 'GET show' do
    it 'gives a 401 to a guest' do
      get :show, id: board.id
      expect(response.code).to eq '401'
    end

    it 'gives a 401 to user that is not a board member' do
      sign_in FactoryGirl.create(:user)
      get :show, id: board.id
      expect(response.code).to eq '401'
    end

    it 'gives access to a member of the board with normal access' do
      sign_in members.first.user
      get :show, id: board.id
      expect(response.code).to eq '200'
    end

    it 'gives access to a member of the board with admin access' do
      sign_in board.user
      get :show, id: board.id
      expect(response.code).to eq '200'
    end
  end
end