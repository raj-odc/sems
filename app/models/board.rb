class Board < ApplicationRecord
  belongs_to :board_type
  has_many :message
  has_many :profile
  has_many :class_list
  has_many :payment_info
  has_many :salary_detail
  has_many :site_customization
  has_many :batch_list
end
