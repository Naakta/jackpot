# Jackpot

### By completing this assignment, you will...
* be able to model data from the app's problem domain with a custom class
* understand how to create custom methods for model objects to perform non-standard comparison with each other
* better understand the disposability of objects
* understand how to enable on-demand cell creation by the user and add them to the tableview
* have more practice using model classes, delegation, and custom cells.

### Part 1
Create a single view application that shows a table view as its main interface to the user. Provide a Navigation Controller to handle view transitions. Create an "add" button in the navigation bar that when tapped, will generate a quick pick lottery number and place it in a cell in the table view. Quick pick is defined as a lottery ticket that is randomly generated. A lottery ticket is 6 integers that are within the range 1 through 53. Once a number is picked, it cannot be picked again on the same ticket.

### Part 2

Once you have the above functionality working, extend the functionality by adding a winning number view that allows the user to select the winning numbers for the lottery drawing. Also add a method or methods that search through your random tickets and determine which ones are winners.

A winning ticket is one that has at least three numbers that match the winning ticket.

* 3 numbers = $1
* 4 numbers = $5
* 5 numbers = $20
* 6 numbers = $100

### Things to consider

* The cell needs to display both the lottery ticket numbers, as well as the amount won, if the ticket is a winner.
* A view to prompt the user for the _winning_ numbers (best to be a _modal_ view).
* A button on the main tableview to transition to the _winning_ number view mentioned above.
* A button on the _winning_ number view that transitions back to the tableview and initiate a check for which tickets are winners.
* The `Ticket` model needs to include additional state items for tracking the winning status and the dollar amount of winnings.
* The `Ticket` model should implement the `Equatable` protocol to check for ticket equality. Additionally, a `compareTicket` method that takes a ticket object as an argument and compares it with another ticket to determine how many digits are the same is necessary to determine the prize amount for that ticket.
* The view controller managing the tableview needs logic that can compare each ticket in the list with the _winning_ ticket and then highlight the winners by changing the cell background color and displaying the winning amount in the cell.

#### Hard Mode (Optional)

* Either use the same _winning_ view you've already created, or a new view to ask the user for their custom lottery numbers. You can either get a quick-pick or choose your own numbers when playing the lottery, so this view will allow users to generate/track their quick pick numbers as well as the numbers they've picked themselves.
* Once the user provides their 6 custom numbers, generate a lottery ticket model object and send it to the tableview for display.