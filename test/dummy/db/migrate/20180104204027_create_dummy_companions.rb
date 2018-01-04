class CreateDummyCompanions < ActiveRecord::Migration[5.1]
  def change
    create_table :dummy_companions do |t|
      t.string :property_a
      t.timestamps
    end
    add_belongs_to :dummy_models, :dummy_companion
  end
end
