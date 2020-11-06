class PostsTag
  include ActiveModel::Model
  attr_accessor :image, :title, :text, :user_id, :name

  validates :image, :title, :text, :name, presence: true
  
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
      post.update!(title: title, text: text, tags: tags)
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
      title: post.title,
      text: post.text,
      name: post.tags.pluck(:name).join(','),
    }
  end

  def split_tag_names
    name.split(',')
  end
end
