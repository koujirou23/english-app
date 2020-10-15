class PostsTag
  include ActiveModel::Model
  attr_accessor :image, :title, :text, :user_id, :name

  validates :image, :title, :text, :name, presence: true

  def save
    post = Post.create(image: image, title: title, text: text, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    PostTag.create(post_id: post.id, tag_id: tag.id)
  end
end
