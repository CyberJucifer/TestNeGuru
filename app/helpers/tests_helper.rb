module TestsHelper
  def test_header
    if @test.persisted?
      test_header_edit
    else
      test_header_create
    end
  end

  private

  def test_header_create
    "Create New Test"
  end

  def test_header_edit
    "Edit #{@test.title} Test"
  end
end
