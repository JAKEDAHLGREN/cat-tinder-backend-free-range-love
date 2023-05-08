require 'rails_helper'

RSpec.describe Cow, type: :model do
  it "should validate name exists in the entry" do
    cow = Cow.create(age:12, enjoys:"Rolling in the hay", color:"Brown", species:"Angus", image:"Cowsonly.com")
    expect(cow.errors[:name]).to_not be_empty
  end

  it "Should validate age exists in the entry" do
    cow = Cow.create(name:"Chuck", enjoys:"Rolling in the hay", color:"Brown", species:"Angus", image:"Cowsonly.com")
    expect(cow.errors[:age]).to_not be_empty
  end

  it "Should validate enjoys exists" do
    cow = Cow.create(name:"Chuck", age: 12, color:"Brown", species:"Angus", image:"cowsonly.com")
    expect(cow.errors[:enjoys]).to_not be_empty
  end

  it "Should validate color exists" do
    cow = Cow.create(name:"Chuck", age: 12, enjoys:"Rolling in the hay", species:"Angus", image:"cowsonly.com")
    expect(cow.errors[:color]).to_not be_empty
  end

  it "Should validate species exists" do
    cow = Cow.create(name:"Chuck", age: 12, enjoys:"Rolling in the hay", color:"Brown", image:"cowsonly.com")
    expect(cow.errors[:species]).to_not be_empty
  end

  it "Should validate image exists" do
    cow = Cow.create(name:"Chuck", age: 12, enjoys:"Rolling in the hay", color:"Brown", species:"Angus")
    expect(cow.errors[:image]).to_not be_empty
  end

  it "Should have an enjoys statement >= 10" do
    cow = Cow.create(name:'Chuck', age: 12, enjoys:'Grass', color:'Brown', species:'Angus', image:'Cowsonly.com')
    expect(cow.errors[:enjoys]).to_not be_empty
  end
    
end
