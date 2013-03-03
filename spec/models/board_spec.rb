require 'spec_helper'

describe Board do
  let(:board) { FactoryGirl.create :board }

  it 'adds the creator as an admin board member on creation' do
    expect(board.members.where(role: 'admin').first.user).to eq board.user
  end
end