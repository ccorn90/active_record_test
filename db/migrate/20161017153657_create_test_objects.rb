class CreateTestObjects < ActiveRecord::Migration
  def change
    create_table :test_as do |t|
    end

    create_table :test_bs do |t|
      t.references :test_a, foreign_key: true 
    end

    add_column :test_as, :singular_b_id, :integer
  end
end
