# This file is part of REANA.
# Copyright (C) 2023 CERN.
#
# REANA is free software; you can redistribute it and/or modify it
# under the terms of the MIT License; see LICENSE file for more details.

# This is a behavioural test file for the `reana-demo-worldpopulation` repository.

Feature: worldpopulation

    Scenario: Workspace size
        When the workflow is "finished"
        Then the workspace size should be less than 15 MiB

    Scenario: File presence
        When the workflow is finished
        Then the workspace should contain "results/plot.png"

    Scenario: File content
        When the workflow is finished
        Then the file "data/World_historical_and_predicted_populations_in_percentage.csv" should contain "Latin America and the Caribbean"
        And the file "data/World_historical_and_predicted_populations_in_percentage.csv" should contain "Africa"

    Scenario: Run duration
        When the workflow is finished
        Then the workflow run duration should be less than 5 minutes
