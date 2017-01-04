class Filter < ActiveRecord::Base
  belongs_to :user

  enum filter_type: [:product_backlogs]
end
