require 'rails_helper'

RSpec.describe Like, type: :model do
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

    Like.create(
      post:,
      author:
    )
  end

  describe 'Likes' do
    it 'should update likes counter' do
      expect(subject.send(:update_likes_counter)).to be_valid
    end
  end
end
