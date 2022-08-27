Feature: Test scopa server.

  Scenario: Successful Player Registration.
    Given player 1 registration details
      | screenHandle | nathan       |
      | email        | nathan@email |
    And player 2 registration details
      | screenHandle | nathan       |
      | email        | nathan@email |
    When player 1 creates a new game
    Then the game state becomes WAIT_FOR_PLAYER2
    When player 2 joins the game
    Then the game state becomes WAIT_FOR_PLAYER1_MOVE
    And player 1 receives the game status
    And player 2 receives the game status
    And player 1 receives a move request
