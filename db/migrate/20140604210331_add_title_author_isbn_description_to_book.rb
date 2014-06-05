class AddTitleAuthorIsbnDescriptionToBook < ActiveRecord::Migration
  def change
    add_column :books, :Title, :string
    add_column :books, :Author, :string
    add_column :books, :Isbn, :string
    add_column :books, :Description, :string
  end
end
