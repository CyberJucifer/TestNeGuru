class AddCreatorAndCategoryToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference(:tests, :creator, foreign_key: { to_table: :users } )
    add_reference(:tests, :category, foreign_key: true )
  end
end
