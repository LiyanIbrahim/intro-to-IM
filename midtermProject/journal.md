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

Theme planning: </br>
I will have 8 cards displayed on the screen, therefore, I need 4 unique cards. </br>
I also want to prompt the user between 3 themes: Movies, Tv shows and Bands </br>
Movie posters: https://www.movieposters.com/ </br>
TV shows: https://www.fulcrumgallery.com/c38103/tv-show-posters/breaking-bad.htm </br>
Songs: https://www.allposters.com/-st/All-Bands-Posters_c123707_.htm </br>
End of day 1: </br>
I decided to decrease the number of cards to 6 cards. </br>
So far, I have a class called cards and I loaded the images in the places I want them to be. I also made a main menu for the game </br>

## October 17: 

While I spent a significant amount of time yesterday working on the plan for this game. Today, I want to focus on making sure I have most of the functionalities installed. Those include the different buttons and screens and how to navigate them. 

End of day 2: </br>
I managed to include a home screen and three themes, each theme leads to a seperate page and each of these pages has a back button (that looks really cool) that leads back to the main page. </br>
I did not anticipate this to require as much "programming" as it did. But it makes sense since the draw function is continuously running. </br>

## October 19:

During class time, I want to start working on the functionalities of the game and also add comments to the code that I already have written so I don’t forget my thought process and what part of the code does what since I will be working on this project over the next few days. 

