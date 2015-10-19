require 'spec_helper'

Capybara.default_wait_time = 5

describe "settings", :type => :feature do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  describe "default user field settings" do

    it "shows list of posts" do
      login_as(@user)

      posts = FactoryGirl.create_list(:post, 10)

      visit posts_path()

      find("#customize-items").click()

      # Name visible by default
      expect(find("#user_fields_name")["checked"]).to eq(true)
      # Category not visible by default
      expect(find("#user_fields_category")["checked"]).to eq(false)

    end

  end

  describe "saves user field settings", :js => true do

    it "shows list of posts" do
      login_as(@user)

      posts = FactoryGirl.create_list(:post, 10)

      visit posts_path()

      check("Category")

      # Category not visible by default
      find("form#edit_user_1 input[type=submit]").click()

      expect(page).to have_selector("#q_category_id_eq")

    end

  end

end
