require 'spec_helper'
describe "Menus Controller", :type => :controller do
  context "index" do
    let!(:menu) { FactoryGirl.create :menu }
    it "displays a list of menus by name" do
      get '/'
      expect(last_response.body).to include(menu.name)
    end
    it "doesn't show the menu descriptions" do
      get '/'
      expect(last_response.body).to_not include(menu.description)
    end
  end

  context "create menu" do
  let(:valid_menu) { FactoryGirl.create :menu }
    it "creates a menu with valid attributes" do
      expect {
        valid_menu
        post '/menus'
      }.to change(Menu, :count)
    end

    it "includes menu name" do
      post '/menus'
      expect(last_response.body).to include(valid_menu.name)
    end
  end

  context "create invalid menu" do
    let(:invalid_menu) { FactoryGirl.build :menu, name: "bad menu", description: nil }
    it "doesn't create a menu with invalid attributes" do
      expect {
        invalid_menu
        post '/menus'
      }.to_not change(Menu, :count)

      # post '/menus'
      # expect(last_response.body).not_to include("bad menu")
    end

    it "shows errors" do
      post '/menus'
      expect(last_response.body).to include("Description can't be blank")
    end
      # post '/menus'
      # invalid_menu.valid?
      # invalid_menu.errors.empty?.should_not be_true
  end

  context "show menu" do
    let!(:menu) { FactoryGirl.create :menu_with_items }

    it "displays the menu name" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include(menu.name)
    end

    it "displays the menu description" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include(menu.description)
    end
    it "displays the menu start and end dates" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include(menu.start_at.strftime("%d-%m-%Y")  && menu.end_at.strftime("%d-%m-%Y") )
    end
    it "displays a list of all menu items" do
      get "/menus/#{menu.id}"
      expect(last_response.body).to include("Hamburger")
    end
  end
end
