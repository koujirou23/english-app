require 'rails_helper'

RSpec.describe PostsTag, type: :model do
  describe '新規投稿' do
    before do
      @post_tag = FactoryBot.build(:posts_tag)
      @post_tag.image = fixture_file_upload('public/images/test_image.png')
    end

    context '新規投稿がうまくいくとき' do
      it '全ての値が正しく保存されているとき' do
        expect(@post_tag).to be_valid
      end

      it 'tagが空でも保存されるとき' do
       @post_tag.name = nil
       expect(@post_tag).to be_valid
      end
    end

    context '新規投稿がうまくいかないとき' do
      it 'imageが空だと保存できないこと' do
        @post_tag.image = nil
        @post_tag.valid?
        expect(@post_tag.errors.full_messages).to include("Image can't be blank")
      end

      it 'titleが空だと保存できないこと' do
        @post_tag.title = nil
        @post_tag.valid?
        expect(@post_tag.errors.full_messages).to include("Title can't be blank")
      end

      it 'textが空だと保存できないこと' do
        @post_tag.text = nil
        @post_tag.valid?
        expect(@post_tag.errors.full_messages).to include("Text can't be blank")
      end
    end
  end
end
