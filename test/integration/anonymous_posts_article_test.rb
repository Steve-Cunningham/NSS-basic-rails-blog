require 'test_helper'

class AnonymousPostsArticleTest < ActionDispatch::IntegrationTest
  test "view a list of articles" do
    Post.create!(title: "First Post!!", body: "This is awkward... I have nothing to say :(")
    Post.create!(title: "Wow, it's been a while!", body: "And yet, I'm still not a writter :( :( lolol")

    visit '/'
    click_link "View All Posts"
    assert_current_path '/posts'
    # assume we have a page variable
    assert_include page.content, "First Post!!"
    #=> assert page.content.include? "First Post!!"
    assert_include page.content, "Wow, it's been a while!"
  end
end