class ViewCountToQuestions < ActiveRecord::Migration[5.0]
  def change

    # add_column is a migration method that takes three arguments:
    # first is table name
    # second is column name
    # third is column type
    add_column :questions, :view_count, :integer
  end
end
