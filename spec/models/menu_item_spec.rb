require 'spec_helper'
describe MenuItem do
  context "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :description }
    it { should validate_presence_of :price }
    it { should validate_presence_of :menu } # Not Passing
  end

  context "associations" do
    it { should belong_to :menu }
  end

  context "#name" do
    let(:menu_item){ FactoryGirl.build :menu_item }
    it "should return name of menu item" do 
      expect(menu_item.name).to eq "Hamburger"
    end
  end
end
