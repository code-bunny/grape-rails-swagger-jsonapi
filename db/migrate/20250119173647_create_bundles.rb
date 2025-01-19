class CreateBundles < ActiveRecord::Migration[8.0]
  def change
    create_table :bundles do |t|
      t.string :title

      t.timestamps
    end
  end
end
