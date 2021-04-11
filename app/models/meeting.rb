class Meeting < ApplicationRecord
  belongs_to :user, inverse_of: :meetings
end
