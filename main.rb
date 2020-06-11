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

class Employee
  def initialize(name, gross_salary_pa)
    @name = name
    @gross_salary_pa = gross_salary_pa
  end

  def generate_monthly_payslip
    p "Monthly Payslip for: %s" % [@name]
    p "Gross Monthly Income: $%0.2f" % [self.compute_monthly_income]
    p "Monthly Income Tax: %0.2f" % [self.compute_monthly_tax]
    p "Net Monthly Income: %0.2f" % [self.compute_net_monthly_income]
  end

  def compute_monthly_income
    return (@gross_salary_pa/12.0).round(2)
  end

  def compute_monthly_tax
    income = @gross_salary_pa
    first_bracket = income && [Tax.first_tax_bracket.cap, income].min;
    income -= Tax.first_tax_bracket.cap

    second_bracket = income && [Tax.second_tax_bracket.cap, [income, 0].max].min;
    income -= Tax.second_tax_bracket.cap

    third_bracket = income && [Tax.third_tax_bracket.cap, [income, 0].max].min;
    income -= Tax.third_tax_bracket.cap

    fourth_bracket = income && [Tax.fourth_tax_bracket.cap, [income, 0].max ].min;
    income -= Tax.fourth_tax_bracket.cap

    fifth_bracket = income && [income, 0].max;

    total_tax = first_bracket * Tax.first_tax_bracket.rate
    total_tax += second_bracket * Tax.second_tax_bracket.rate
    total_tax += third_bracket * Tax.third_tax_bracket.rate
    total_tax += fourth_bracket * Tax.fourth_tax_bracket.rate
    total_tax += fifth_bracket * Tax.max_tax_bracket.rate
    return (total_tax/12.0).round(2)
  end

  def compute_net_monthly_income
    return (self.compute_monthly_income - self.compute_monthly_tax).round(2)
  end
end