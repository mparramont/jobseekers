class Job < ActiveRecord::Base
  extend FriendlyId
  friendly_id :title, use: :slugged

  enum job_length: [:permanent, :temporary, :contract]
  enum job_type: [:full_time, :part_time]

  before_save { MarkdownWriter.update_html(self) }

  validates :title, presence: true, length: { maximum: 100 }, uniqueness: true
  validates :content_md, presence: true

  paginates_per 30

  belongs_to :user
  belongs_to :category
  has_many :applications

  scope :published, lambda { where(draft: false).order("updated_at DESC") }
  scope :drafted, lambda { where(draft: true).order("updated_at DESC") }
end
