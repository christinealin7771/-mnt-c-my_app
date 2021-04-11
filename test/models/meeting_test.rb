require "test_helper"

class MeetingTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "redirect to login is not signed in" do
    get meetings_path
    assert_redirected_to new_user_session_path
  end
end
