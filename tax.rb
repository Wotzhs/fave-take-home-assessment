class Tax
  FIRST_TAX_BRACKET = { cap: 20000,  rate: 0.00 }
  SECOND_TAX_BRACKET = { cap: 20000, rate: 0.10 }
  THIRD_TAX_BRACKET = { cap: 40000, rate: 0.20 }
  FOURTH_TAX_BRACKET = { cap: 100000, rate: 0.30 }
  MAX_TAX_RATE = { rate: 0.40 }
  
  def self.first_tax_bracket
    return Struct.new(*FIRST_TAX_BRACKET.keys).new(*FIRST_TAX_BRACKET.values)
  end

  def self.second_tax_bracket 
    return Struct.new(*SECOND_TAX_BRACKET.keys).new(*SECOND_TAX_BRACKET.values)
  end

  def self.third_tax_bracket 
    return Struct.new(*THIRD_TAX_BRACKET.keys).new(*THIRD_TAX_BRACKET.values)
  end

  def self.fourth_tax_bracket
    return Struct.new(*FOURTH_TAX_BRACKET.keys).new(*FOURTH_TAX_BRACKET.values)
  end

  def self.max_tax_bracket
    return Struct.new(*MAX_TAX_RATE.keys).new(*MAX_TAX_RATE.values)
  end
end