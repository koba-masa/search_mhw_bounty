class Type < ApplicationRecord

  def type_map
    Type.all.pluck(:id, :type_name).to_h
  end
end