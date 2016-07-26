Feature: Page content

  Scenario: Check for important text on the page
    Given Caseworker is using the Income Proving Service Case Worker Tool
    Given the account data for JL123456A
    When Robert submits a query
      | NINO                    | JL123456A  |
      | Application Raised Date | 15/01/2015 |
    Then the service displays the following result
      | Page static detail          | They don't meet the financial requirement because:                                             |
      | What to do next heading     | What to do next                                                                                |
      | What to do next sub heading | You should consider if the applicant meets the financial requirement under any other category. |

  Scenario: Page checks for Category A financial text write up
    Given Caseworker is using the Income Proving Service Case Worker Tool
    Given the account data for TL123456A
    When Robert submits a query
      | NINO                    | TL123456A  |
      | Application Raised Date | 23/01/2015 |
    Then the service displays the following result
      | Page heading     | Financial requirement check                                   |
      | Page sub heading | Does the applicant meet the Category A financial requirement? |

  Scenario: Page checks for appendix link
    Given Caseworker is using the Income Proving Service Case Worker Tool
    Given the account data for TL123456A
    When Robert submits a query
      | NINO                    | TL123456A  |
      | Application Raised Date | 23/01/2015 |
    Then the service displays the following result
      | Page appendix title | Where can I find the appendix?                         |
      | Chapter 8 link      | Chapter 8 of the immigration directorate instructions. |
      | FM 1_7 link         | Appendix FM 1.7                                        |

  Scenario: Input Page checks for Category A financial text write up
    Given Caseworker is using the Income Proving Service Case Worker Tool
    When Robert is displayed the Income Proving Service Case Worker Tool input page
    Then the service displays the following result
      | Page sub title | Individual's details                                                                            |
      | Page sub text  | You can check an individual meets the Category A requirement using a National Insurance Number. |
