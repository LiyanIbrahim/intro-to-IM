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

End of Oct 19: </br>
I realized I did not like the way the background image in the Game theme clashed with the back of the card and since the front of the cards are also images that are colorful and complicated, I think a simpler image is better (It will also have text like the player’s score) </br>
I fixed the placements and size of the cards so they look like what I want them to look it on the screen during the game </br>
I don’t think it would work if I used the mousePressed function since I’m navigating different scenes for different mousePressed() functions </br>

## Planning the progress for the next few days:
Progress I’m planning over the next few days to ensure I have enough time to work on the different aspects of the game. </br>

October 20: </br>
Work on the game portion of the game. (Figure out the functionalities and have at least one theme working). </br>
Replicate it so the game of the entire theme is working </br>

October 22: </br>
Add sound </br>
Make the final scene of the game (game over scene). </br>
Make a button that promotes the user to go back to the main menu. </br>


## October 21

Some issues I’ve faced: </br>
Since I’m navigating between different screens and those screens require mousePressed functions that are different, when I picked the theme by pressing on one of the boxes, the card behind it will also reveal. Therefore, I am making a button that will let the user know where to click on the box for the theme in a place that does not overlap with the rest of the cards. 

## October 22:  
Debugging: </br> 
<ol>
  <li> Index out of range error fixing </li>
  <li> Wrong string being associated with each poster so wrong game </li>
  </ol> 
  
## October 25: 

Debugging: </br>
<ol>
  <li>Cards flipping is causing an issue. First issue is that if two cards don't match, the program flips all the cards including the ones that are already matched and flipped → using the wrong index </li>
  <li>The second card does not flip if the cards are not the same </li>
  <li>If the cards aren’t the same, then the second card flips as the first card of the second round. </li>
  </ol>

Solutions(?):</br>
For the first problem: I was using the wrong index since I was using a for loop to go through all the cards to flip. However, this is no longer an issue since I have to change the way the game works because I’m having an issue with point 2 and 3 and so I will approach it differently and point 1 becomes less relevant. 
Using millis() did not work in my case and I think it is because I

This is my new approach: </br>
Instead of having a timer that flips the cards, the user will flip them by pressing the right arrow. That way, if the cards are matched, then the cards will show the “matched” image, if not then the user can flip the cards back. </br>
I might also implement a certain song for each scene and use it kind of like a self timer. 

**Important things I’ve realized:**

Even though using classes helped significantly, I’ve realized that I should’ve made a deck of cards class and that would’ve facilitated the use of the different features across the themes more efficiently than hard coding it like I did. It would also be easier to see the different variables more clearly and prevent the index out of range error in a way that is better than what I’ve done.  </br>
I wish I used this method before since having three classes almost exactly the same was unnecessary but I realized this too far in and so it made more sense to continue. </br>
I have also realized that I put the movie theme in place of the TV show slot. It would be easier to modify the string array with the filenames for the picture being loaded but it would be misleading once reading the code </br>


