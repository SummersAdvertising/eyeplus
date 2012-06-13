class RenameOrderToBoard < ActiveRecord::Migration
  def up
  	rename_column :boards, :order, :order_number
  end

  def down
  	rename_column :boards, :order_number, :order
  end
end
