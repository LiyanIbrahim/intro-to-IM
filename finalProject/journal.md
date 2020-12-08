## Week 1: 

### Day1:  

For my initial idea, I want to make an automated support system that uses processing and arduino and allows the user to portray their emotions and feelings without speaking. The program will use the different sensors to try to detect what the user is feeling and provide support based on that. I want this system to be really interactive and, to a certain extent, personalized towards what the user inputs and what the system is reading from the sensor. 

**Motivation:** 

We often think or assume that robots and machines are unbiased and easier to talk to due to the lack of human judgement. I wanted to play on that idea and make a system that offers support as a pose to someone you can speak to. 

Brainstorming: 

Here is a rough initial idea of somethings my robot could do: 

![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/Screen%20Shot%202020-11-23%20at%206.02.33%20PM.png)

### Day2: 

**Refined initial concept:**

While my initial concept was a support system, I think specifying it even more would make the product better and have features that are specific and explicit. Therefore, I decided to make it a study support system. Additionally, the design of the robot would be tailored towards this instead of being a very generally designed physical system.   

**Idea for implementation:** 

I want the body of this (or the arduino part) to be receptive to the surroundings and for the processing window to be the one the user controls. 

**Brainstorming the implementation:**

![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/day2.png)

**My initial plan for implementing this:**

A cube structure:
One face for placing a drink. Detected by motion sensor. Has a temperature sensor to detect the temperature. Prompts the user to pick if it’s cold or iced. System will move on but display a reading on the edge if the drink gets too cold or too hot as the user does other things. 

One face for taking a break. Activated by pressing a button. Prompts users for 3 different things.1. A power nap → play relaxing music 2. Play a game → controls on arduino 3. Dance party → using servo motors and LED’s 

One face for holding different parts. Since I will be making this for myself. I would implement sockets for things I normally use. 

One face as the introduction for this entire game. Possibly using a button/mouse clicked to start the study system. 


After Identifying the different functionalities (which are prone to change), I need to create the graphics for each function and face for processing. But before doing that, I want to identify a color palette that I will use consistently in my project. 

**Color palette**

Color 1: 160, 154, 188</br>
Color 2: 182, 166, 202</br>
Color 3: 213, 207, 225</br>
Color 4: 225, 222, 233</br>
Color 5: 212, 190, 190</br>

### Day 3
I used today to get the bulk of the work done on this assignment so I can identify the missing or the parts that I need to get done later. </br>
I wired up the entire arduino setup and this is how it looked:</br>
This uses 2 breadboards but I’ll probably end up using three or four. </br>

![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/Screen%20Shot%202020-11-27%20at%2010.35.02%20PM.png)

Then, since I had my graphics done, I started with the code and I immediately had to change some things such as which sensors control what since we have limited supply and I want the device I was building to be user friendly and intuitive and so with that, some functionalities I had in mind had to change since they depended on the sensors they used. </br>
An example would be that I wanted to use the potentiometer to switch between the song playlists but now I’m using a toggle switch for turning on/off the music instead and using the potentiometer to pick between the 2 different modes (study mode and break mode). </br>
This is what the plan for the functionality looks like so far: </br>
Study Mode → plays study music </br>
Break Mode → 1. Plays relaxing music, 2. Game mode, 3. Dance party mode </br>

I’ve also made the skeleton of my project which I will then decorate and add the arduino to. </br>
![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/Screen%20Shot%202020-11-27%20at%2010.34.12%20PM.png)

![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/Screen%20Shot%202020-11-27%20at%2010.34.23%20PM.png)

![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/Screen%20Shot%202020-11-27%20at%2010.34.36%20PM.png)

![](https://github.com/LiyanIbrahim/intro-to-IM/blob/master/finalProject/Screen%20Shot%202020-11-27%20at%2010.34.52%20PM.png)

Technical things I have left: </br>
<ul>
  <li>I need to figure out the game. I have a rough code for what I want it to be but I need to figure out the technicalities of it since I want it to be a complex enough game but I want the instructions to be simple enough for the user to understand and take in since it is a game to play during “break time”. </li>

<li>Add LEDs</li>
<li>I need to add songs. I only added the study mode songs now since it makes the processing program take a very long time to load so it was easier for me, since I am constantly changing things, to load them at the end. </li>
<li>To decorate my box </li>
</ul>

## Week 2 

I decided to not use some components because they made the system less effective and some just did not make sense. I also spent 4 hours!!! debugging my code due to an error in the sound file. It was crunchy and staticy and it would not stop even after calling the .stop() function for each sound file. I ended up figuring it out by going on discord and looking in the search button for “sound” and I found a question that was asked a couple weeks ago that related to my issue and helped me debug it! 
I now need to decorate my box ad]nd enclose my arduino in it. 
I also made a game that is fun to play and embedded that into my program.

## Week 3

This week, I started off by tackling the enclosure since it was the main thing I haven’t spent time on. I fell into the trap of decorating the box before seeing if it fits and if I like the way it looks. I did end up hating the way it looks mainly because of the way it fit on top of the wires. Therefore, I completely reconstructed it and now, it looks and fits better but isn’t (in my opinion) ideal for like “a study tool”. But because of the time constraints of this project and the lack of less bulky wires, I decided to just stick to it since it worked. 

At this point, I was theoretically “done” and all I needed to do is film and write the documentation. But for some reason, I started doubting my project idea as a whole. It’s due in 2 days and I have more than 450 lines of code in processing and more in arduino done and so really not much I can do about it. I think I started to dislike it because I put so much time into it and kept replaying it over and over again that I started to, in some sense, become sick of it. I also think part of it is because I’m designing this “product” and so it’s supposed to be continuously used by the user and is inherently less exciting than a game (even though mine has an embedded game in it). 


