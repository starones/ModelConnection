class JobRequest < ApplicationRecord
  belongs_to :client

  validates :title, presence: true
  validates :job_content, presence: true
  validates :recruitment_gender, presence: true
  validates :recruitment_stature, presence: true
  validates :recruitmebt_other, presence: true
  validates :money, presence: true
end
