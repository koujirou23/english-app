class PostsTag
  include ActiveModel::Model
  attr_accessor :image, :title, :text, :user_id, :name

  validates :image,  presence: true

  with_options presence: true do
    validates :title, format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
    validates :text,  format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
    validates :name,  format: {with: /\A[^ぁ-んァ-ン一-龥]/, message: 'is invalid. Input half-width characters.'}
  end

  
  delegate :persisted?, to: :post

  def initialize(attributes = nil, post: Post.new)
    @post = post
    attributes ||= default_attributes
    super(attributes)
  end

  def save
    return if invalid?

    ActiveRecord::Base.transaction do
      tags = split_tag_names.map { |name| Tag.find_or_create_by!(name: name) }
      post.update!(image: image, title: title, text: text, tags: tags)
    end
  rescue ActiveRecord::RecordInvalid
    false
  end

  def to_model
    post
  end

  private

  attr_reader :post

  def default_attributes
    {
      image: post.image,
      title: post.title,
      text: post.text,
      name: post.tags.pluck(:name).join(','),
    }
  end

  def split_tag_names
    name.split(',')
  end
end
