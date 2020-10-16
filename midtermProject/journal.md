## Concept: 

My initial idea is to make a themed memory card game in which the user has the choice to pick between three different themes and based on that theme, play the card game. Based on the theme, the cards, images, sounds are colors that will differ. Although this game can be implemented in multiple ways, I would like to adapt it so it is a single player game. </br>
The player will have a counter for the number of moves and the score. A perfect score in this game means that the number of moves =score. 

## Journal: 
### October 16: 

Today, I plan on making an outline of the program in pseudocode version to see if it makes sense and if this is something I am capable of making in this time frame. Additionally I plan on starting with the code and making a simple version of this game that I can then add the other complexities. </br>

Pseudocode: </br>
Class Card that should have the following parameters:</br>
Boolean that can tell me if the image is flipped </br>
Card width and height (not too sure if I need that but might be important so I will keep it for now)</br>
Card x and y positions </br>
Array of card images </br>
Functionalities needed: </br>
Displaying the cards (from the back)</br>
Displaying the cards (from the front) </br>

I also need to make an array of Cards, index of each card and fill the array in a way so that they are all displayed on the screen (using a for loop and an array for the x position and an array for the y position) </br>
Display the cards on the screen in the draw function → in the display function, the back of the card is the default </br>
Flip the card function that will flip the card and limit flipping so that it only occurs when you have less than 2 cards </br>
In mouse pressed function, flip the card using the switch card functionality </br> 
Function that checks if the cards match → boolean </br>
Some way to shuffle the cards </br>
My draw function should also display the score and attempts, away to go back to main menu </br>
Function that displays the main menu and function that displays the gameover screen. </br>
