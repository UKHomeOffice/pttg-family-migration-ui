Feature: Tool identifies Applicant meets Category A Financial Requirement

		Requirement to meet Category A
			Applicant or Sponsor has been paid for 6 consecutive months with the same employer

		Financial employment income regulation to pass this Feature File
			Applicant or Sponsor has earned => £1550 Monthly Gross Income EVERY of the 6 months prior to the Application Received Date

  Scenario: Jon meets the Category A Financial Requirement (1)

		Pay date 15th of the month
		Before day of application received date
		He earns £1600 Monthly Gross Income EVERY of the 6 months prior to the Application Received Date

   Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool:
      | NINO      | AA123456A  |
      | Application received date | 23/01/2015 |
    Then The IPS Family TM Case Worker Tool provides the following result:
		| Outcome                               | Success    |
		| Outcome Box Individual Name           | Mark Jones |
		| Outcome From Date                     | 23/07/2014 |
		| Outcome To Date                       | 23/01/2015 |
		| Your Search Individual Name           | Mark Jones |
		| Your Search National Insurance Number | AA123456A  |
		| Your Search Application Received Date | 23/01/2015 |

	Scenario: Jon meets the Category A Financial Requirement (Caseworker enters the National Insurance Number with spaces)

		Pay date 1st of the month 
		After day of application received date
		He earns £1550 Monthly Gross Income EVERY of the 6 months prior to the Application Received Date

    Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool:
      | NINO      | AA 12 34 56 A  |
      | Application received date | 10/01/2015 |
    Then The IPS Family TM Case Worker Tool provides the following result:
		| Outcome                               | Success    |
		| Outcome Box Individual Name           | Mark Jones |
		| Outcome From Date                     | 10/07/2014 |
		| Outcome To Date                       | 10/01/2015 |
		| Your Search Individual Name           | Mark Jones |
		| Your Search National Insurance Number | AA123456A  |
		| Your Search Application Received Date | 10/01/2015 |

  Scenario: Jon meets the Category A Financial Requirement(2)

		Pay date 28th of the month 
		After day of application received date
		He earns £2240 Monthly Gross Income EVERY of the 6 months prior to the Application Received Date

   Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool:
      | NINO      | BB123456B  |
      | Application received date | 23/01/2015 |
    Then The IPS Family TM Case Worker Tool provides the following result:
		| Outcome | Success |
		| Outcome Box Individual Name | Jon Taylor |
		| Outcome From Date | 23/07/2014 |
		| Outcome To Date | 23/01/2015 |
		| Your Search Individual Name | Jon Taylor |
		| Your Search National Insurance Number | BB123456B | 
		| Your Search Application Received Date | 23/01/2015 |

  Scenario: Jon meets the Category A Financial Requirement (3)

		Pay date 23rd of the month
		On same day of application received date
		He earns £1551 Monthly Gross Income EVERY of the 6 months prior to the Application Received Date

   Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool:
      | NINO      | CC123456C  |
      | Application received date | 23/01/2015 |
    Then The IPS Family TM Case Worker Tool provides the following result:
		| Outcome | Success |
		| Outcome Box Individual Name | Jon Taylor |
		| Outcome From Date | 23/07/2014 |
		| Outcome To Date | 23/01/2015 |
		| Your Search Individual Name | Jon Taylor |
		| Your Search National Insurance Number | CC123456C | 
		| Your Search Application Received Date | 23/01/2015 |

  Scenario: Jon meets the Category A Financial Requirement (Caseworker enters the Application Received Date with single numbers for the day and month)

                Pay date 1st of the month
                After day of Application Received Date
		 He earns £3210 Monthly Gross Income EVERY of the 6 months prior to the Application Received Date


    Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert submits a query to IPS Family TM Case Worker Tool:
      | NINO      | AA123456A  |
      | Application received date | 9/1/2015 |
    Then The IPS Family TM Case Worker Tool provides the following result:
                | Outcome | Success |
                | Outcome Box Individual Name | Jon Taylor |
                | Outcome Employment Threshold | £18,600 |
                | Outcome From Date | 09/07/2014 |
                | Outcome To Date | 09/01/2015 |
                | Your Search Individual Name | Jon Taylor |
                | Your Search National Insurance Number | AA123456A |
                | Your Search Application Received Date | 09/01/2015 |