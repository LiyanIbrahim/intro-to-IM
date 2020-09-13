//setup
size(500, 500);
background(245, 211, 215);

//hair
fill(48, 33, 0);
rect(130, 100, 240, 320, 52);

//neck and necklace
//1.neck
fill(255, 227, 201);
rect(190, 300, 120, 140);
//2.necklace
strokeWeight(4);
stroke(110, 153, 255);
line(191, 380, 310, 380);
//setting everything back
strokeWeight(2);
stroke(0, 0, 0);

//face
fill(255, 227, 201);
ellipse(width / 2, height / 2, 175, 240);
fill(48, 33, 0);

//part of hair that covers the side of the face
stroke(48, 33, 0);
rect(150, 190, 20, 140);
rect(330, 190, 20, 140);

//nose
stroke(0, 0, 0);
fill(255, 227, 201);
beginShape();
curveVertex(225, 220);
curveVertex(240, 240);
curveVertex(250, 270);
curveVertex(90, 200);
endShape();

//mouth
fill(212, 42, 54);
ellipse(250, 320, 40, 30);
fill(0, 0, 0);
line(230, 320, 240, 320);
line(240, 320, 250, 315);
line(250, 315, 260, 320);
line(260, 320, 270, 320);

//eyes
fill(255, 255, 255);
stroke(0, 0, 0);
ellipse(206, 205, 32, 25);
ellipse(294, 205, 32, 25);
fill(153, 102, 0);
ellipse(206, 205, 10, 10);
ellipse(294, 205, 10, 10);

//eyebrows
fill(71, 48, 0);
arc(206, 185, 30, 15, radians(180), radians(360), CHORD);
arc(294, 185, 30, 15, radians(180), radians(360), CHORD);

//extra on skin
//1.mole
fill(0, 0);
strokeWeight(3);
point(265, 300);
//2.some makeup
fill(255, 212, 217, 90);
noStroke();
ellipse(200, 260, 34, 20);
ellipse(300, 260, 34, 20);
