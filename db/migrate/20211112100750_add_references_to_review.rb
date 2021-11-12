class AddReferencesToReview < ActiveRecord::Migration[6.0]
  def change
    add_reference :reviews, :list
  end
end
