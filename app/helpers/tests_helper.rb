module TestsHelper
  def test_header(test)
    @test.persisted? ? test_header_edit(test) : test_header_create
  end

  private

  def test_header_create
    "Create New Test"
  end

  def test_header_edit(test)
    "Edit #{test.title} Test"
  end
end
