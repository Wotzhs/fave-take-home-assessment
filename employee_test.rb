require "minitest/autorun"
require "minitest/reporters"
require_relative "employee.rb"

Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

describe "Employee Ren with gross salary of $60,000.00" do
  before do
    @employee = Employee.new("Ren", 60000)
  end

  it "has a monthly income of $5,000.00" do
    _(@employee.compute_monthly_income).must_equal 5000
  end

  it "has a monthly income tax of $500.00" do
    _(@employee.compute_monthly_tax).must_equal 500
  end

  it "has a monthly net income of $4,500.00" do
    _(@employee.compute_net_monthly_income).must_equal 4500
  end
end

describe "Employee Ren with gross salary of $200,000.00" do
  before do
    @employee = Employee.new("Ren", 200000)
  end

  it "has a monthly income of $16,666.67" do
    _(@employee.compute_monthly_income).must_equal 16666.67
  end

  it "has a monthly income tax of $4,000.00" do
    _(@employee.compute_monthly_tax).must_equal 4000
  end

  it "has a monthly net income of $12,666.67" do
    _(@employee.compute_net_monthly_income).must_equal 12666.67
  end
end

describe "Employee Ren with gross salary of $80,150.00" do
  before do
    @employee = Employee.new("Ren", 80150)
  end

  it "has a monthly income of $6,679.17" do
    _(@employee.compute_monthly_income).must_equal 6679.17
  end

  it "has a monthly income tax of $837.08" do
    _(@employee.compute_monthly_tax).must_equal 837.08
  end

  it "has a monthly net income of $5,842.09" do
    _(@employee.compute_net_monthly_income).must_equal 5842.09
  end
end