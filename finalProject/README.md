# Welcome to my Final Project! 

## Concept: 

For my final project, I decided to make an integrated and interactive study support system  using Arduino and Processing. This was heavily inspired by the pre-Covid idea of having a study support system through a friend. I thought automating this experience for this project is an interesting experiment to see how effective this could potentially be and to compare and contribute to the question of humans vs machines.

## In depth excussion: 

When thinking about the different functionalities of this product, I was using two different molds: what a human friend can provide, and how this device can go further. </br> 
Therefore, the functionalities were mainly divided into two sections: a study section and a break section. </br>
The study section is rather simple. Study (focus) music will be played for the user to have a study session. The music is 10 minutes long and loops when done. Therefore, it could also be used as an internal timer of the time and timing how long to go before taking a break. </br>
The break section is a little more complex. The user can do three things: nap, dance or play. Nap will play soft, relaxing music. Dance will have the LEDs light up in different patterns and Play will have a processing game for the user to play. </br>


I wanted the game to be something particular since the nature of presence of the game is in a study tool and its purpose is to be part of a break and not a source of challenge or anxiety. Therefore, I decided to eliminate the losing part of the game and completely make it a game with a score that doesn’t mean anything </br>

## Construction: 

I wanted the physical product to mean something which is the reason I decorated the enclosure, I think the physical prototype is important in drawing the emphasis that my arduino part is more than just a remote control but a whole support system. Therefore, a lot of the functionalities that could’ve been done by mousePressed were done using arduino sensors and why I have some options written on the physical prototype to guide the user instead of the screen (this also includes the LEDs lighting up).
 
## Video: 

## Challenges: 

<li> Sound: I’ve had a lot of difficulty debugging a certain issue with the songs I was playing. I knew it was part of my code since the mp3 file was fine and when I was using the built in examples, it did not sound staticy and distorted. However, at that point, I had around 200 lines of codes and too many if statements and loops involved in the production of the sound and I knew one of them was causing the issue but it was hard to identify since they all contributed in some way to the program working. I documented this issue more in detail in my journey but eventually it turns out I was playing the song continuously in the loop and the solution was putting an if statement to only play the song if it’s ntr being played.  </li>
<li> Pot values:  I also had some issues with identifying correct and accurate pot values for the different modes. There was some delay between changing the pot and the processing screen changing and I couldn’t figure out how to stop or prevent the delay but eventually I left it because I think it was just how communication between arduino and processing works because I was not using delays in any of my programs  </li>
<li> Construction: I put this under the challenges part since to me, this was an unexpected challenge that I faced. I had this entire idea of how I wanted to construct my “product” and once I completely finished constructing it and printing the different decorations and sticking them on, I really dislike the way it looked with the breadboards inside because the wires kind of made it higher than I wanted it to be and so I ended up completely reconstructing the entire thing. Also, I used regular paper that I printed a certain shade of color (because I was sticking to a color palette for consistency) and I was using a hot glue gun and it burnt through the paper multiple times.  </li>
<li> Doubt: This is rather a different kind of challenge. After finishing the program, the nature of my project is something that is more of a continuous product that the user can use and is more of a “help” tool rather than a fast paced game. And because of that, I think I started to view my project as a bit underwhelming and I wanted to do something else but it just didn’t make sense to do that since I was completely done with more than 500 lines of code on processing and even more on arduino and I had the hardware setup and had the proposal already made. I also eventually accepted that my project isn’t bad in the way I executed but the nature of the project I picked isn’t extremely exciting. </li>

## Resources: 

<li> https://www.openprocessing.org/sketch/1026505</li>
<li> https://forum.processing.org/two/discussion/23123/error-disabling-serialevent</li>
<li> https://happycoding.io/tutorials/processing/collision-detection</li>


