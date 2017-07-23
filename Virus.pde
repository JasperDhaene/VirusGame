class Virus 
{
  PImage v_virusImage;
  int v_power;
  int v_timer;
  int v_type;
  //pos X&Y voor N(eutral)
  float v_posX, v_posY;
  int imageWidth, imageHeight;
  boolean mouseDrag;

  Virus(int virusType)
  {
    v_timer = 0;

    v_type = virusType;
    if(virusType == m_neutral){
      v_posX= random(50, 1150);
      v_posY = random(50, 550);
      v_power = 0;
      imageWidth = 25;
      imageHeight = 25;
    }else if(virusType == m_friend){
      v_posX = width-100;
      v_posY = 100;
      v_power = 50;
      imageWidth = 50;
      imageHeight = 50;
    }else if(virusType == m_enemy){
      v_posX = 100;
      v_posY = height-100;
      v_power = -50;
      imageWidth = 50;
      imageHeight = 50;
    }
    v_virusImage = loadImage("virusforms.png");
    
  }
  public void update() //updates per seconde
  {
    v_timer++;
    if (v_timer == 60)
    {
      v_power += v_type;
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
    
    // (img, posX, posY, size, size, pixelstartX, pixelstartY, pixelendX, pixelendY)

    
    if(v_type == m_neutral){
      image(v_virusImage, v_posX, v_posY, 50, 50, 0,0,100,100);
    }
    if(v_type == m_friend){
      image(v_virusImage, v_posX, v_posY, 100, 100, 200, 0, 300, 100);
    }
    if(v_type == m_enemy){
      image(v_virusImage, v_posX, v_posY, 100, 100, 100, 0, 200, 100);
    }
    
    text(v_power, v_posX, v_posY);
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
      if ( mouseX > v_posX-25 && mouseX < v_posX + 25 &&  mouseY > v_posY - 25 && mouseY < v_posY + 25) 
      {
        //println("NEUTRAL");
        ellipse(v_posX, v_posY, 75, 75);
      } else {
        //println("no3");
      }
    }
  }
  
  public void checkPower(){
    if(v_power > 0){
      v_type = m_friend;
    }
    if(v_power < 0){
      v_type = m_enemy;
    }
  }
  
  public boolean isHit(){
    if(abs(v_posX - mouseX) < imageWidth && abs(v_posY - mouseY) < imageHeight){
      return true;
    }
    return false;
  }
  //get posX and posY of the random virus, 
  public float getPosX()
  {
    return v_posX;
  }
  public float getPosY()
  {
    return v_posY;
  }
  
  public int getPower(){
    return v_power;
  }
  
  public void setPower(int newPower){
    v_power = newPower;
  }
  public void addPower(int newPower){
    v_power += newPower;
  }
}