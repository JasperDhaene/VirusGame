class Virus 
{
  PImage v_friend, v_neutral, v_enemy;
  int v_powerF, v_powerE, v_powerN;
  int v_timer;
  //pos X&Y voor N(eutral)
  float v_posN_X, v_posN_Y;
  boolean mouseDrag;

  Virus()
  {
    v_timer = 0;
    v_powerF = 50;
    v_powerE= -50;
    v_posN_X= random(50, 1150);
    v_posN_Y = random(50, 550);
  }
  public void update() //updates per seconde
  {
    v_timer++;
    if (v_timer == 60)
    {
      if (v_powerF > 0) { 
        v_powerF++;
      } 
      if (v_powerF == 0) {
        v_powerF = 0;
      } 
      if (v_powerF < 0) {
        v_powerF--;
      }
      //-------------------------------//
      
      if (v_powerN > 0) { 
        v_powerN++;
      } 
      if (v_powerN == 0) {
        v_powerN = 0;
      } 
      if (v_powerN < 0) {
        v_powerN--;
      }
      //-------------------------------//

      if (v_powerE < 0) { 
        v_powerE--;
      } 
      if (v_powerE == 0) {
        v_powerE = 0;
      } 
      if (v_powerE > 0) {
        v_powerE++;
      }

      v_timer = 0;
    }
  }
  public void display()
  {
    //array (friend, enemy, neutral 1-6)
    //if(power > 0, color red), if 0, grey, if < 0, blue) is de ideaal.


    imageMode(CENTER);
    textAlign(CENTER);
    textSize(15);
    v_friend = loadImage("virusforms.png");
    v_neutral = loadImage("virusforms.png");
    v_enemy = loadImage("virusforms.png");
    // (img, posX, posY, size, size, pixelstartX, pixelstartY, pixelendX, pixelendY)

    //friend
    if (v_powerF > 0) {
      image(v_friend, width-100, 100, 100, 100, 200, 0, 300, 100);
    } 
    if (v_powerF == 0)
    {
      image(v_neutral, width-100, 100, 100, 100, 0, 0, 100, 100);
    }
    if ( v_powerF < 0) 
    { 
      image(v_enemy, width-100, 100, 100, 100, 100, 0, 200, 100);
    }
    text(v_powerF, width-101, 106);

    //-------------------------------//
    //neutral
   // image(v_neutral, v_posN_X, v_posN_Y, 50, 50, 0, 0, 100, 100);
    if (v_powerN > 0) {
      image(v_friend, 100, height-100, 100, 100,  0, 0, 100, 100);
    } 
    if (v_powerN == 0)
    {
      image(v_neutral, v_posN_X, v_posN_Y, 50, 50, 0, 0, 100, 100);
    }
    if ( v_powerN < 0) 
    { 
      image(v_enemy, 100, height-100, 100, 100, 0, 0, 100, 100);
    } 

    //-------------------------------//
    //enemy
    //image(v_enemy, 100, height-100, 100, 100, 100, 0, 200, 100);
    if (v_powerE < 0) {
      image(v_enemy, 100, height-100, 100, 100, 100, 0, 200, 100);
    } 
    if (v_powerE == 0)
    {
      image(v_enemy, 100, height-100, 100, 100, 0, 0, 100, 100);
    }
    if ( v_powerE > 0) 
    { 
      image(v_enemy, 100, height-100, 100, 100, 200, 0, 300, 100);
    }
    text(v_powerE, 99, height-94);
  }

  public void hitTest()
  {
    //mousepressed/mousereleased
    //draw line vanuit hoofdvirus, if released op neutral, v_PowerF(of E)/2, neutral word F of E
  }


  void virusDetection()//test methode
  {
    ellipseMode(CENTER);
    noFill();
    strokeWeight(6);
    stroke(255, 255, 255);

    //Printlns zijn om de hitdetectie te testen
    //enemy
    if (mousePressed == true) 
    {
      if ( mouseX > 50 && mouseX < 150 &&  mouseY > height-150 && mouseY < height-50) 
      {
        //println("ENEMY");
        ellipse(100, height-100, 120, 120);
      } else {
        //println("no1");
      }
      //-------------------------------//
      //friend
      if ( mouseX > width - 150 && mouseX < width-50 &&  mouseY > 50 && mouseY < 150) 
      {
        //println("FRIEND");
        ellipse(width-100, 100, 120, 120);
      } else {
        //println("no2");
      }
      //-------------------------------//
      //neutral
      if ( mouseX > v_posN_X-25 && mouseX < v_posN_X + 25 &&  mouseY > v_posN_Y - 25 && mouseY < v_posN_Y + 25) 
      {
        //println("NEUTRAL");
        ellipse(v_posN_X, v_posN_Y, 75, 75);
      } else {
        //println("no3");
      }
    }
  }
  //get posX and posY of the random virus, 
  public float getPosX()
  {
    return v_posN_X;
  }
  public float getPosY()
  {
    return v_posN_Y;
  }
}