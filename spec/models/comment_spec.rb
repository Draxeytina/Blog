require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    author = User.new(
      name: 'Tom',
      photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
      bio: 'Teacher from Mexico.',
      posts_counter: 0
    )

    post = Post.new(
      author:,
      title: 'Hello',
      text: 'This is my first post',
      comments_counter: 0,
      likes_counter: 0
    )

    Comment.create(
      text: 'comment',
      post:,
      author:
    )
  end

  describe 'Comments' do
    it 'should update comments counter' do
      expect(subject.send(:comment_counter)).to be_truthy
    end
  end
end
