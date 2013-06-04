require 'test_helper'

class AnonymousBrowsesArticlesTest < ActionDispatch::IntegrationTest
  test "view a list of articles" do
    Post.create!(title: "First Post!!", body: "This is awkward... I have nothing to say :(")
    Post.create!(title: "Wow, it's been a while!", body: "And yet, I'm still not a writter :( :( lolol")
    assert_equal 2, Post.count
    visit '/posts'
    assert_include page.body, "All Posts"
    assert_include page.body, "First Post!!"
    assert_include page.body, "Wow, it's been a while!"
  end
end