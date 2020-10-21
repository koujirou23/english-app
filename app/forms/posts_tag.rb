class PostsTag
  include ActiveModel::Model
  attr_accessor :image, :title, :text, :user_id, :name

  validates :image,  presence: true

  with_options presence: true do
    validates :title, format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
    validates :text,  format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
    validates :name,  format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
  end

  def save
    post = Post.create(image: image, title: title, text: text, user_id: user_id)
    tag = Tag.where(name: name).first_or_initialize
    tag.save
    PostTag.create(post_id: post.id, tag_id: tag.id)
  end

end