class Situation < ApplicationRecord
  has_many :steps, dependent: :destroy

  has_many :study_logs, as: :loggable, dependent: :destroy

  validates :slug,     presence: true, uniqueness: true
  validates :title,    presence: true
  validates :overview, presence: true
  validates :scenario, presence: true
end
