Feature: Pass - Category A Financial Requirement (with dependents - weekly pay)

		Requirement to meet Category A
			Applicant or Sponsor has received 26 payments from the same employer over 182 day period prior to the Application Raised Date

		Financial income regulation to pass this Feature File
			Income required amount no dependant child = £18600 (£1550 per month or above for EACH of the previous 6 months from the Application Raised Date)
			Additional funds for 1 dependant child = £3800 on top of employment threshold
			Additional funds for EVERY subsequent dependant child = £2400 on top of employment threshold per child

		Financial income calculation to pass this Feature File
			Income required amount + 1 dependant amount + (Additional dependant amount * number of dependants)/52 weeks in the year = 26 Weekly Gross Income payments => threshold in the 182 day period prior to the Application Raised Date

			1 Dependant child - £18600+£3800/52 = £430.77
			2 Dependant children - £18600+£3800+£2400/12 = £476.92
			3 Dependant children - £18600+£3800+(£2400*2)/12 = £523.08
			5 Dependant children - £18600+£3800+(£2400*4)/12 = £615.38
			7 Dependant children - £18600+£3800+(£2400*6)/12 = £707.69
			ETC

#New scenario - Added in SD126
  Scenario: Tony Singh meets the Category A Financial Requirement with 1 dependent

		Pay date 22nd of the month
		Before day of application Raised date
		He has received 26 Weekly Gross Income payments of £466.01 in the 182 day period prior to the Application Raised Date
		He has 1 dependent child

   Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool (with dependants):
      | NINO      | TL123456A  |
      | Application Raised date | 23/02/2015 |
      | Dependent | 1 |
    Then The IPS Family TM Case Worker Tool provides the following result (with dependents):
		| Outcome                               | Success    |
		| Outcome Box Individual Name           | Tony Singh  |
		| Outcome From Date                     | 23/08/2014 |
		| Outcome To Date                       | 23/02/2015 |
		| Your Search Individual Name           | Tony Singh |
		| Your Search Dependent                 | 1 |
		| Your Search National Insurance Number | TL123456A  |
		| Your Search Application Raised Date | 23/02/2015 |

#New scenario - Added in SD126
  Scenario: Jennifer Toure meets the Category A Financial Requirement with 3 dependent

		Pay date 10th of the month
		After day of application Raised date
		He has received 26 Weekly Gross Income payments of £606.00 in the 182 day period prior to the Application Raised Date
		He has 3 dependent child

   Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool (with dependants):
      | NINO      | JT123456C  |
      | Application Raised date | 4/12/2015 |
      | Dependent | 3 |
    Then The IPS Family TM Case Worker Tool provides the following result (with dependents):
		| Outcome                               | Success    |
		| Outcome Box Individual Name           | Jennifer Toure |
		| Outcome From Date                     | 04/06/2014 |
		| Outcome To Date                       | 04/12/2015 |
		| Your Search Individual Name           | Jennifer Toure |
		| Your Search Dependent                 | 3 |
		| Your Search National Insurance Number | JT123456C  |
		| Your Search Application Raised Date | 04/12/2015 |

#New scenario - Added in SD126
  Scenario: Lela Vasquez meets the Category A Financial Requirement with 5 dependent

		Pay date 22nd of the month
		On the same day of application Raised date
		He has received 26 Weekly Gross Income payments of £615.38 in the 182 day period prior to the Application Raised Date
		He has 5 dependent child

   Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool (with dependents):
      | NINO      | LV987654B  |
      | Application Raised date | 22/07/2015 |
      | Dependent | 5 |
    Then The IPS Family TM Case Worker Tool provides the following result (with dependents):
		| Outcome                               | Success    |
		| Outcome Box Individual Name           | Lela Vasquez |
		| Outcome From Date                     | 22/01/2015 |
		| Outcome To Date                       | 22/07/2015 |
		| Your Search Individual Name           | Lela Vasquez |
		| Your Search Dependent                 | 5 |
		| Your Search National Insurance Number | LV987654B  |
		| Your Search Application Raised Date | 22/07/2015 |
