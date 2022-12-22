# PEDAC Mortgage / Car Loan Calculator #

Expected Input and Output
Input:
  - loan amount
  - monthly interest rate
  - loan duration
Output:
  - monthly payment

Implicit Requirements and Identify Rules
  - “Monthly interest rate” - how much interest you would be charged in one month
  - “Annual Percentage Rate (APR)” - how much interest you would be charged in a year
  - Interest rate must be expressed as a decimal for percentages
  - Loan duration is in months (1 year = 12 months)
  - If you’re working with APR, you’ll need to convert that to a monthly interest rate (if interest rate is 5%, 0.05 / 12 to get monthly interest rate)

Clarifying Questions
  - Are negative numbers allowed? Loan amount, loan duration, and monthly interest rate must be a positive value.
  - How will input be provided? As integers or floats
  - How will output be formatted? As a float rounded to the second decimal (ie. $ 589.73)
  - What happens when no input is provided? Ask user to input a valid number that is > 0

Mental Model
  - Store the values for loan amount, interest rate, and loan duration as integers or floating point values. Compute and return the monthly payment owed using these values.

Examples

  Example 1
    Input:
      loan_amount = 80,000
      annual_interest_rate = 5% -> 0.05 / 12 = .00416667
      loan_term_years = 10 -> 10.0 * 12 = 120.0
    Output:
      monthly_payment = 46.94

  Example 1 - Calculations
    monthly_payment = loan_amount * [interest_rate (1 + interest_rate)^12] / [(1 + interest_rate)^12 - 1]
    = 80000 [.00416667 (1 + 00416667)^120] / [(1 + 00416667)^12 - 1]
    = 80000 [.00416667 (1.647009563)] / [0.647009563]
    = 80000 (0.010606552)
    = 846.52416

  Example 2
    Input:
      loan_amount = 10,000
      interest_rate = 3% -> 0.03 / 12 = .0025
      loan_duration = 1 -> 1.0 * 12 = 12
    Output:
      monthly_payment = 846.94

  Example 2 - Calculations
    monthly_payment = loan_amount * [interest_rate (1 + interest_rate)^12] / [(1 + interest_rate)^12 - 1]
    = 10000 [.0025 (1 + .0025)^12] / [(1 + .0025)^12-1]
    = 10000 [.0025(1.030415957)] / [0.030415957]
    = 10000 (0.084693699)
    = 846.93699

Test Cases that Handle Edge Cases
# Unsure how to go about this section...
  - negative numbers?
  - super high numbers?

Data Structure/Algorithm
# Taken from pseudo-code writeup
  - Get the loan amount
    - Make sure it’s valid, otherwise ask for another input
  - Get the yearly interest rate
    - Make sure it’s valid, otherwise ask for another input
  - Get the loan duration in months
    - Make sure it’s valid, otherwise ask for another input
  - Perform calculation using formula to get the monthly payment
  - Display result
  - Ask if user wants to do another calculation
