# This migration comes from translation_client (originally 20150312203345)
class InitialSchema < ActiveRecord::Migration
    def change
    create_table :translations do |t|
      t.string :locale
      t.string :translation_key
      t.text   :value
      t.text   :interpolations
      t.boolean :is_proc, :default => false

      t.timestamps
    end
    
    add_index :translations, [:locale, :translation_key], unique: true
  end
end
