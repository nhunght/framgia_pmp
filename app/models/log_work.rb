class LogWork < ActiveRecord::Base
  belongs_to :activity
  belongs_to :master_sprint
end
