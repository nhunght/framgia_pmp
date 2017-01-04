class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.references :user, foreign_key: true
      t.integer :filter_type
      t.text :content
      t.integer :target_id
      t.boolean :is_turn_on
      t.string :target_params

      t.timestamps
    end
    add_index :filters, :user_id, name: :index_filters_on_user_id
  end
end
