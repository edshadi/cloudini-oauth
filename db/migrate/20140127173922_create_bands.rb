class CreateBands < ActiveRecord::Migration
  def change
    create_table(:bands) do |t|
      t.string :name
    end
  end
end
