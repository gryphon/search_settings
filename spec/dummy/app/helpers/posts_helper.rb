module PostsHelper

  def post_category_field post
    return post.category.name
  end

end
