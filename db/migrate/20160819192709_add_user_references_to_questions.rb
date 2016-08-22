class AddUserReferencesToQuestions < ActiveRecord::Migration[5.0]
  def change
    #rails g migration add_user_references_to_questions user:references
    add_reference :questions, :user, foreign_key: true
  end
end
