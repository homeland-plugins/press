class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  enum status: %i(upcoming published rejected)

  before_save :generate_summary

  def to_param
    self.slug || self.id
  end

  def self.find_by_slug!(slug)
    Post.find_by(slug: slug) || Post.find_by(id: slug) || raise(ActiveRecord::RecordNotFound.new(slug: slug))
  end

  private

  def generate_summary
    if self.summary.blank?
      self.summary = self.body.split("\n").first(10).join("\n")
    end
  end
end
