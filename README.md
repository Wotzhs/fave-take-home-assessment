### Setup

1. Install Ruby
2. Install Bundler `gem install bundler`
3. CREATE A NEW REPO in github
4. Add this README file on your new repo
5. Create a feature branch from your clone
6. Run `bundle install` This will install all dependencies for our test runner
7. Add a unit test framework you can select between minitest or rspec

If you have any question or clarification about the code. Please create an issue on the main repo and tag me @renlesterdg

### What do we expect?

That you are able to:
- create a repo, create a branch and a pull request using git and github.
- multiple commits with a good commit message. We are more interested on your thought processes rather than the final code
- create unit tests
- design and create the solution using Object Oriented approach
- use atleast 1 design pattern
- create a REST API

### Instructions

- When you are done, Please open a `pull request` from YOUR `feature branch` to YOUR `master branch`.
- Please come prepared to talk about your approach per commit.

## Requirement

1. You are tasked to create a function to compute a monthly payslip of an individual based on his annual salary.
Example:

`generate_monthly_payslip "Ren" 60000`

will return an output in console:

```
 Monthly Payslip for: "Ren"
 Gross Monthly Income: $5000.00
 Monthly Income Tax: $500.00
 Net Monthly Income: $4500.00
```
- 2 decimal places

2. Create a REST API to expose your function [You can get some idea here](https://www.google.com/search?safe=active&ei=9euNXp-VPK6d4-EP-Ou7oAM&q=simple+rest+api+ruby&oq=simple+rest+api+ruby)
- GET
- REQUEST Parameters should include employee_name and annual_salary
- The response body should return the following structure:
```
{
  "employee_name": string,
  "gross_monthly_income": string,
  "monthly_income_tax": string,
  "net_monthly_income": string,
}
```

## The Tax Bracket is as follows

| Salary Bracket | Rate |
|----------|:-------------:|
| first 0 - 20000 | 0% |
| next 20001-40000 | 10% |
| next 40001-80000 | 20% |
| next 80001-180000 | 30% |
| 180001 and above | 40% |

## Sample Tax Computation 1

Annual Salary 60000

| Salary Bracket | Rate | Taxable Amount | Total Tax |
|---|---|---|---|
| first 0 - 20000 | 0% | 20000 | 0 |
| next 20001-40000 | 10% | 20000 | 2000 |
| next 40001-80000 | 20% | 20000 | 4000 |
| next 80001-180000 | 30% | 0 | 0 |
| 180001 and above | 40% | 0 | 0 |

Total Taxable Amount
= 20000 + 20000 + 20000
= 60000

Total Annual Tax
= 2000 + 4000
= 6000

## Sample Tax Computation 2

Annual Salary 200000

| Salary Bracket | Rate | Taxable Amount | Total Tax |
|---|---|---|---|
| first 0 - 20000 | 0% | 20000 | 0 |
| next 20001-40000 | 10% | 20000 | 2000 |
| next 40001-80000 | 20% | 40000 | 8000 |
| next 80001-180000 | 30% | 100000 | 30000 |
| 180001 and above | 40% | 20000 | 8000 |

Total Taxable Amount
= 20000 + 20000 + 40000 + 100000 + 20000
= 200000

Total Annual Tax
= 2000 + 8000 + 30000 + 8000
= 48000

## Sample Tax Computation 3

Annual Salary 80150

| Salary Bracket | Rate | Taxable Amount | Total Tax |
|---|---|---|---|
| first 0 - 20000 | 0% | 20000 | 0 |
| next 20001-40000 | 10% | 20000 | 2000 |
| next 40001-80000 | 20% | 40000 | 8000 |
| next 80001-180000 | 30% | 150 | 45 |
| 180001 and above | 40% | 0 | 0 |

Total Taxable Amount
= 20000 + 20000 + 40000 + 150
= 80150

Total Annual Tax
= 2000 + 8000 + 45
= 10045

### Fave Engineering Culture

We just did a video and shared about our product and engineering culture you can [find it here](https://www.linkedin.com/posts/fave-group_wearefave-digitalproduct-product-activity-6592343555904245760-tlQm)
