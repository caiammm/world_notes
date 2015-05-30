class Post < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  validates :title, presence: true
  validates :content, presence: true
  validates :tags, presence: true

  belongs_to :user
  has_many :comments
  has_many :bad_reports

  def update_votes_count
    count = Vote.where(post_id: self.id).count
    self.update_attribute(:votes, count)
  end

end
