module HomesHelper
  def checked_condition(bounty, conditions_type)
    bounty.present? && bounty[:conditions] == conditions_type.to_s
  end

  def selected_rank(map, bounty)
    bounty.present? ? bounty[:rank] : "10"
  end

  def selected_condition(bounty, conditions_type, default=nil)
    bounty.present? && bounty[:conditions] == conditions_type.to_s ? bounty[conditions_type] : default
  end
end
