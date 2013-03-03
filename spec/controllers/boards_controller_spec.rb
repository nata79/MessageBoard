require 'spec_helper'

describe BoardsController do
  describe 'GET create' do
    it 'adds a new board' do
      count = Board.count
      post :create, { board: { name: 'Message Board' } }
      expect(Board.count).to eq (count + 1)
    end
  end
end