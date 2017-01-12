class Attach < ApplicationRecord
  belongs_to :project
  validates :name, presence: {message: 'Please provide a project name'}
  validates :data, presence: {message: 'Empty data not allowed'}
  validates :data_type, presence: {message: 'Please state data type'}
  validates :project_id, presence: {message: 'Please state related project id'}
end
