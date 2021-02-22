module TestsHelper
  def test_header(test)
    @test.persisted? ? test_header_edit(test) : test_header_create
  end

  private

  def test_header_create
    t('.create_new_test')
  end

  def test_header_edit(test)
    t('.edit_test', title: test.title)
  end
end
