Feature: Tool identifies Applicant does not meet the Category A Financial Requirement

	Requirement to meet Category A
      Applicant or Sponsor has received < 6 consecutive monthly payments from the same employer over the 182 day period prior to the Application Raised Date

	Financial employment income regulation to pass this Feature File
      Applicant or Sponsor has earned 6 monthly payments < £1550 Monthly Gross Income in the 182 days prior to the Application Raised Date

#Changed Scenario - Removed word monthly from output text - SD105
	Scenario: Jill does not meet the Category A Financial Requirement (She has earned < the Cat A financial threshold)

	Pay date 15th of the month
	Before day of Application Raised Date
	She earns £1000 Monthly Gross Income EVERY of the 6 months prior to the Application Raised Date

		Given Caseworker is using the Income Proving Service Case Worker Tool
		When Robert submits a query:
			| NINO                    | JL123456A  |
			| Application Raised Date | 15/01/2015 |
		Then The service for Cat A Failure provides the following result:
			| Page dynamic heading                  | Jill Lewondoski doesn't meet the Category A salaried requirement |
			| Category A check failure reason       | they haven't met the required amount.           |

			| Your Search Individual Name           | Jill Lewondoski                                         |
			| Your Search National Insurance Number | JL123456A                                               |
			| Your Search Application Raised Date   | 15/01/2015                                              |

#Changed Scenario - Removed word monthly from output text - SD105
	Scenario: Francois does not meet the Category A Financial Requirement (He has earned < the Cat A financial threshold)

	Pay date 28th of the month
	After day of Application Raised Date
	He earns £1250 Monthly Gross Income EVERY of the 6 months prior to the Application Raised Date

		Given Caseworker is using the Income Proving Service Case Worker Tool
		When Robert submits a query:
			| NINO                    | FL123456B  |
			| Application Raised Date | 28/03/2015 |
		Then The service for Cat A Failure provides the following result:
			| Page dynamic heading                  | Francois Leblanc doesn't meet the Category A salaried requirement |
			| Category A check failure reason       | they haven't met the required amount.            |

			| Your Search Individual Name           | Francois Leblanc                                         |
			| Your Search National Insurance Number | FL123456B                                                |
			| Your Search Application Raised Date   | 28/03/2015                                               |

#Changed Scenario - Removed word monthly from output text - SD105
	Scenario: Kumar does not meet the Category A employment duration Requirement (He has worked for his current employer for only 3 months)

	Pay date 3rd of the month
	On same day of Application Raised Date
	He earns £1600 Monthly Gross Income BUT for only 3 months prior to the Application Raised Date
	He worked for a different employer before his current employer

		Given Caseworker is using the Income Proving Service Case Worker Tool
		When Robert submits a query:
			| NINO                    | KS123456C  |
			| Application Raised Date | 03/07/2015 |
		Then The service for Cat A Failure provides the following result:
			| Page dynamic heading                  | Kumar Sangakkara Dilshan doesn't meet the Category A salaried requirement |
			| Category A check failure reason       | they haven't been with their current employer for 6 months.      |

			| Your Search Individual Name           | Kumar Sangakkara Dilshan                                         |
			| Your Search National Insurance Number | KS123456C                                                        |
			| Your Search Application Raised Date   | 03/07/2015                                                       |
