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

  def self.search(params)
    result = Worker.includes(:department, :projects).references(:department, :projects)

    if params['fn'].present?
      result = result.where('workers.fn = ?', params['fn'])
    end

    if params['sn'].present?
      result = result.where('workers.sn = ?', params['sn'])
    end

    if params['ln'].present?
      result = result.where('workers.ln = ?', params['ln'])
    end

    if params['passport'].present?
      result = result.where('workers.passport = ?', params['passport'])
    end

    if params['inn'].present?
      result = result.where('workers.inn = ?', params['inn'])
    end

    if params['birthday'].present?
      result = result.where('workers.birthday = ?', params['birthday'])
    end

    if params['position'].present?
      result = result.where('workers.position = ?', params['position'])
    end


    result
  end

end
