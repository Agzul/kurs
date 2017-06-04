class Worker < ActiveRecord::Base
  has_many                      :worker_projects, dependent: :destroy
  has_many                      :projects, through: :worker_projects
  belongs_to                    :department
  accepts_nested_attributes_for :department, allow_destroy: true, reject_if: :all_blank

  VALID_STRING_NUMBER = /\A\d+\z/

  validates :fn,       presence: true
  validates :sn,       presence: true
  validates :ln,       presence: true
  validates :passport, presence: true, uniqueness: true, length: { is: 10 }, format: { with: VALID_STRING_NUMBER }
  validates :inn,      presence: true, uniqueness: true, length: { is: 12 }, format: { with: VALID_STRING_NUMBER }
  validates :birthday, presence: true
  validates :position, presence: true
end
