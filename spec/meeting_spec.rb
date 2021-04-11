require 'rails_helper'

class MeetingTest < ActiveSupport::TestCase
  test "should get index" do
    get meetings_path
    assert_redirected_to :success
  end
end