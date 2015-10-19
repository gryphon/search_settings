require 'spec_helper'

describe "table", :type => :feature do

  before :each do
    @user = FactoryGirl.create(:user)
  end

  describe "no user field settings" do

    it "shows list of posts" do
      posts = FactoryGirl.create_list(:post, 10)

      visit posts_path()

      # Name visible by default
      expect(page).to have_content posts[0].name
      # Category not visible by default
      expect(page).to_not have_content posts[0].category.name

    end

  end

  describe "default user field settings" do

    it "shows list of posts" do

      login_as(@user)
      posts = FactoryGirl.create_list(:post, 10)

      visit posts_path()

      # Name visible by default
      expect(page).to have_content posts[0].name
      # Category not visible by default
      expect(page).to_not have_content posts[0].category.name

    end

  end

  describe "customized user field settings" do

    it "shows list of posts" do
      @user.set_search_settings_for(Post, fields:["name","category"])
      login_as(@user)

      posts = FactoryGirl.create_list(:post, 10)

      visit posts_path()

      # Name visible by default
      expect(page).to have_content posts[0].name
      # Category not visible by default
      expect(page).to have_content posts[0].category.name

    end

  end


end
