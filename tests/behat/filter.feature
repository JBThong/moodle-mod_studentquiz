@mod @mod_studentquiz
Feature: Filtering in Studentquiz view.

  Background:
    Given the following "courses" exist:
      | fullname | shortname | category |
      | Course 1 | C1        | 0        |

    And the following "users" exist:
      | username | firstname | lastname | email                |
      | student1 | Sam1      | Student1 | student1@example.com |
      | student2 | Sam2      | Student2 | student2@example.com |
    And the following "course enrolments" exist:
      | user     | course | role    |
      | student1 | C1     | student |
      | student2 | C1     | student |
    And the following "activities" exist:
      | activity    | name               | intro                     | course | idnumber     | publishnewquestion |
      | studentquiz | StudentQuiz Test 1 | StudentQuiz description 1 | C1     | studentquiz1 | 1                  |
    And the following "questions" exist:
      | questioncategory               | qtype     | name            | questiontext          |
      | Default for StudentQuiz Test 1 | truefalse | Test question 1 | Answer the question 1 |
      | Default for StudentQuiz Test 1 | truefalse | Test question 2 | Answer the question 2 |

  @javascript @_switch_window
  Scenario: Rating filtering
    When I am on the "StudentQuiz Test 1" "mod_studentquiz > View" page logged in as "admin"
    And I should see "Show more..."
    Then I click on "Show more..." "link"
    And I set the field "Rating value" to "TF 01"
    And I press "id_submitbutton"
    And I should see "You must enter the number"
    And I set the field "Rating value" to "-2"
    And I press "id_submitbutton"
    And I should see "The Rating can not be a negative number"

  @javascript @_switch_window
  Scenario: Difficulty filtering
    When I am on the "StudentQuiz Test 1" "mod_studentquiz > View" page logged in as "admin"
    And I should see "Show more..."
    Then I click on "Show more..." "link"
    And I set the field "Difficulty value" to "TF 01"
    And I press "id_submitbutton"
    And I should see "You must enter the number"
    And I set the field "Difficulty value" to "-2"
    And I press "id_submitbutton"
    And I should see "The Difficulty can not be a negative number"

  @javascript @_switch_window
  Scenario: Comments filtering
    When I am on the "StudentQuiz Test 1" "mod_studentquiz > View" page logged in as "admin"
    And I should see "Show more..."
    Then I click on "Show more..." "link"
    And I set the field "Comments value" to "TF 01"
    And I press "id_submitbutton"
    And I should see "You must enter the number"
    And I set the field "Comments value" to "-2"
    And I press "id_submitbutton"
    And I should see "The Comments can not be a negative number"

  @javascript @_switch_window
  Scenario: My attempts filtering
    When I am on the "StudentQuiz Test 1" "mod_studentquiz > View" page logged in as "admin"
    And I should see "Show more..."
    Then I click on "Show more..." "link"
    And I set the field "My attempts value" to "TF 01"
    And I press "id_submitbutton"
    And I should see "You must enter the number"
    And I set the field "My attempts value" to "-2"
    And I press "id_submitbutton"
    And I should see "The My attempts can not be a negative number"

  @javascript @_switch_window
  Scenario: My difficulty filtering
    When I am on the "StudentQuiz Test 1" "mod_studentquiz > View" page logged in as "admin"
    And I should see "Show more..."
    Then I click on "Show more..." "link"
    And I set the field "My difficulty value" to "TF 01"
    And I press "id_submitbutton"
    And I should see "You must enter the number"
    And I set the field "My difficulty value" to "-2"
    And I press "id_submitbutton"
    And I should see "The My difficulty can not be a negative number"

  @javascript @_switch_window
  Scenario: My Rating filtering
    When I am on the "StudentQuiz Test 1" "mod_studentquiz > View" page logged in as "admin"
    And I should see "Show more..."
    Then I click on "Show more..." "link"
    And I set the field "My Rating value" to "TF 01"
    And I press "id_submitbutton"
    And I should see "You must enter the number"
    And I set the field "My Rating value" to "-2"
    And I press "id_submitbutton"
    And I should see "The Comments can not be a negative number"