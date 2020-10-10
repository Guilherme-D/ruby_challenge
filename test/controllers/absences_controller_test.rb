require 'test_helper'

class AbsencesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get absences_index_url
    assert_response :success
  end

end
