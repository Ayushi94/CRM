class CreateCsvFileImports < ActiveRecord::Migration
  def change
    create_table :csv_file_imports do |t|

      t.timestamps
    end
  end
end
