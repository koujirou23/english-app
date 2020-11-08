require 'rails_helper'

RSpec.describe '新規投稿', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @posts_tag = FactoryBot.build(:posts_tag)
  end

  context '新規投稿ができるとき' do
    it '正しい情報を入力すれば新規投稿ができてトップページに移動する' do
      # トップページに移動する
      visit root_path
      # ログインする
      sign_in(@user)
      # トップページに新規投稿ページへ遷移するボタンがあることを確認する
      expect(page).to have_content('New post')
      # 新規投稿ページへ移動する
      visit new_post_path
      # 投稿情報を入力する
      image_path = Rails.root.join('public/images/test_image.png')
      attach_file('post-image', image_path)
      fill_in 'title', with: @posts_tag.title
      fill_in 'text', with: @posts_tag.text
      fill_in 'tag', with: @posts_tag.name
      # 投稿するボタンを押すとpostモデル,tagモデル,post_tagモデルのカウントが1上がることを確認する
      expect  do
        expect do
          expect do
            find('input[name="commit"]').click
            sleep 1
          end.to change { PostTag.count }.by(1)
        end.to change { Tag.count }.by(1)
      end.to change { Post.count}.by(1)
      # トップページに遷移することを確認
      expect(current_path).to eq root_path
      # 先程出品した投稿が存在することを確認
      expect(page).to have_selector('img')
      # 先程出品した投稿情報があることを確認する
      expect(page).to have_content(@posts_tag.title)
    end

    context '新規投稿ができないとき' do
      it '正しい情報を入力しないときは投稿ページへ戻される' do
        # トップページに移動する
        visit root_path
        # ログインする
        sign_in(@user)
        # トップページに新規投稿ページへ遷移するボタンがあることを確認する
        expect(page).to have_content('New post')
        # 新規投稿ページへ移動する
        visit new_post_path
        # 商品情報を入力する
        fill_in 'title', with: ''
        fill_in 'text', with: ''
        fill_in 'tag', with: ''
        # 投稿ボタンをクリックする
        click_on('Post')
        # 投稿ページへ遷移することを確認する
        expect(current_path).to eq posts_path
      end
    end

    context '新規投稿ができないとき' do
      it 'ログインしていないと出品できない時' do
        # トップページに移動する
        visit root_path
        # トップページに新規投稿ページへ遷移するボタンがないことを確認する
        expect(page).to have_no_content('New post')
      end
    end
  end
end
