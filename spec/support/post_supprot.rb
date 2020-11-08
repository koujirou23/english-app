module PostSupport
  def post(_post)
    # トップページに移動する
    visit root_path
    # トップページに新規投稿ページへ遷移するボタンがあることを確認する
    expect(page).to have_content('New post')
    # 新規投稿ページへ移動する
    visit new_post_path
    # 投稿情報を入力する
    image_path = Rails.root.join('public/images/test_image.png')
    attach_file('post-image', image_path)
    fill_in 'title', with: @post.title
    fill_in 'text', with: @post.text
    fill_in 'tag', with: @tag.name
    # 投稿するボタンを押すとpostモデル,tagモデル,post_tagモデルのカウントが1上がることを確認する
    expect  do
      expect do
        find('input[name="commit"]').click
        sleep 1
      end.to change { PostTag.count }.by(1)
    end.to change { Post.count }.by(1)
    # トップページに遷移することを確認
    expect(current_path).to eq root_path
    # 先程出品した投稿が存在することを確認
    expect(page).to have_selector('img')
    # 先程出品した投稿情報があることを確認する
    expect(page).to have_content(@post.title)
  end
end
