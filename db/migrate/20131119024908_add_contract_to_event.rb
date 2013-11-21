class AddContractToEvent < ActiveRecord::Migration
  def change
  	add_attachment :events, :contract
  end
end
