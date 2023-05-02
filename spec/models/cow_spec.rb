require 'rails_helper'

RSpec.describe Cow, type: :model do
  it 'should validate name' do
    cow = Cow.create
    expect(cow.errors[:name]).to_not be_empty
  end
    it 'enjoy statement should be at least 10 characters long' do
      cow = Cow.create(name:'chuck', age: 12, enjoys:'grass', color:'brown', species:'angus', image:'cowsnonly.com')
      expect(cow.errors[:enjoys]).to_not be_empty
    end
    
end
