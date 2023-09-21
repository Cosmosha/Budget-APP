require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:each) do
    @user = User.create(name: 'Test User', email: 'test@example.com', password: 'password')
    @group = Group.create(name: 'Test Group', author: @user)
  end

  describe 'validations' do
    it 'is valid with valid attributes' do
      entity = Entity.new(name: 'Test Entity', amount: 100, author: @user, group: @group)
      expect(entity).to be_valid
    end

    it 'is not valid without a name' do
      entity = Entity.new(amount: 100, author: @user, group: @group)
      expect(entity).to_not be_valid
    end

    it 'is not valid with a negative amount' do
      entity = Entity.new(name: 'Test', amount: -100, author: @user, group: @group)
      expect(entity).to_not be_valid
    end
  end

  describe 'associations' do
    it 'belongs to an author (User)' do
      association = Entity.reflect_on_association(:author)
      expect(association.macro).to eq(:belongs_to)
    end

    it 'belongs to a group' do
      association = Entity.reflect_on_association(:group)
      expect(association.macro).to eq(:belongs_to)
    end
  end
end
