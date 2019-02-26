require 'rails_helper'

describe "Post" do
  it "is valid with a title and body" do
    post = Post.new(title: 'title', body: 'post body')
    expect(post).to be_valid
  end

  it "searches for posts" do
    post1 = Post.create(title: 'hello world')
    post2 = Post.create(title: 'coding challenge')
    posts = Post.search('hello')

    expect(posts.count).to eq(1)
    expect(posts).to eq([post1])
  end
end

