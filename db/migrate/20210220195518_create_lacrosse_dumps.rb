class CreateLacrosseDumps < ActiveRecord::Migration[6.1]
  def change
    create_table :lacrosse_dumps do |t|
      t.jsonb :data

      t.timestamps
    end
  end
end
