class Virus 
{
  PImage v_virusImage;
  int v_power;
  int v_timer;
  int v_type;
  float v_posX, v_posY;
  int imageWidth, imageHeight;
  boolean mouseDrag;
  boolean v_clicked;

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
      v_posX = random(width/2, width - 100);
      v_posY = random(100, height/2);
      v_power = 50;
      imageWidth = 50;
      imageHeight = 50;
    }else if(virusType == m_enemy){
      v_posX = random(100, width/2);
      v_posY = random(height/2,height-100);
      v_power = -50;
      imageWidth = 50;
      imageHeight = 50;
    }
    v_virusImage = loadImage("virusforms.png");
    v_clicked = false;
    
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
    if(v_clicked){
      ellipseMode(CENTER);
      noFill();
      strokeWeight(6);
      stroke(255, 255, 255);
      ellipse(v_posX, v_posY, 60*abs(v_type) + 60, 60*abs(v_type) + 60);
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
  
  public void setClicked(boolean clicked){
    v_clicked = clicked;
  }
  
  public int getType(){
    return v_type;
  }
}