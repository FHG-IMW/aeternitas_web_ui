class CreatePatents < ActiveRecord::Migration[5.1]
  def change
    create_table :patents do |t|
      t.string :patent_id
    end
  end
end
