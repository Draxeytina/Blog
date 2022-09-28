require 'rails_helper'

RSpec.describe 'Post Show', type: :feature do
  Post.destroy_all
  User.destroy_all
  it 'displays the post title.' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('post1')
  end
  it 'displays who wrote the post' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('brade')
  end
  it 'displays how many comments it has' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Comment.create(text: 'comment1', author:, post:)
    Comment.create(text: 'comment2', author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end
  it 'displays how many likes it has' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Like.create(author:, post:)
    Like.create(author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('1')
    expect(page).to have_content('2')
  end
  it 'displays the post body' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('text1')
  end
  it 'displays the username of each commentor' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Comment.create(text: 'comment1', author:, post:)
    Comment.create(text: 'comment2', author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('brade')
  end
  it 'displays the comment each commentor left' do
    author = User.create(name: 'brade', photo: 'https://robohash.org/daf/', bio: 'teacher')
    post = Post.create(title: 'post1', text: 'text1', author:)
    Comment.create(text: 'comment1', author:, post:)
    Comment.create(text: 'comment2', author:, post:)
    visit "/users/#{author.id}/posts/#{post.id}"
    expect(page).to have_content('comment1')
    expect(page).to have_content('comment2')
  end
end
