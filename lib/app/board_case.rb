class BoardCase
  attr_accessor :case_id, :case_value

  def initialize(case_id, case_value)
    @case_id = case_id
    @case_value = case_value 
  end
end