require 'rails_helper'

describe Friendship, type: :model do
  describe 'relationships' do
    it { should belong_to :user }
    it { should belong_to :friend }
  end
end