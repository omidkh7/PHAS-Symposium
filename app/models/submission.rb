# == Schema Information
#
# Table name: submissions
#
#  id                   :integer          not null, primary key
#  name                 :string
#  email                :string
#  title                :string
#  abstract             :text
#  presentation_type    :string
#  dietary_restrictions :text
#  co_authors           :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Submission < ActiveRecord::Base

  PRESENTATION_TYPES = %w[oral poster attender].freeze
  ATTENDER_TYPES = %w[undergrad msc phd postdoc faculty].freeze

  validates :name, presence: true
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/i }, uniqueness: true
  validates :title, presence: true, length: { maximum: 250 }, unless: "presentation_type == 'attender'"
  validates :abstract, presence: true, length: { maximum: 2000 }, unless: "presentation_type == 'attender'"
  validates :presentation_type, presence: true, inclusion: PRESENTATION_TYPES
  validates :attender_type, presence: true, inclusion: ATTENDER_TYPES, unless: "presentation_type == 'attender'"
  validates :sub_department, presence: true, unless: "presentation_type == 'attender'"
  #validates :will_attend_social_event, presence: true, inclusion: { in: [true, false] }

  scope :orals, -> { where(presentation_type: 'oral') }
  scope :posters, -> { where(presentation_type: 'poster') }
  scope :attenders, -> { where(presentation_type: 'attender') }

end
