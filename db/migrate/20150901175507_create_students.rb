class CreateStudents < ActiveRecord::Migration
  def change
    create_table(:students) do |t|
      t.column(:name, :string)
      t.column(:pair, :string)

      t.timestamps()
    end
  end
end
