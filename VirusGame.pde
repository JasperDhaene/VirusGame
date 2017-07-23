
ArrayList<Virus> virusList;
public static final int m_neutral = 0;
public static final int m_friend = 1;
public static final int m_enemy = -1;

private float m_mouseOriginX;
private float m_mouseOriginY;

private boolean lineDrawn;

private int m_virusOriginIndex;

public static final int splitRatio = 2;

private boolean gameOver = false;

void setup()
{
  size(1200, 600);
  background(0, 0, 0);
  virusList = new ArrayList<Virus>();
  generateVirusses(4,2,1);
}



void draw() 
{
  background(0, 0, 0);
  update();
  checkGameOver();
  render();
  
}

private void update(){
  //render virusses
  for(int i = 0; i<virusList.size();i++){
    virusList.get(i).update();
  }
}

private void render(){
  if(gameOver){
    fill(255, 255, 255);
    textSize(50);
    textAlign(CENTER);
    text("GG EZ boii", width/2, height/2);
    textSize(20);
    text("pliz come again", width/2, height/2+50);
  }else{
    //render virusses
    for(int i = 0; i<virusList.size();i++){
      virusList.get(i).display();
    }
    if(mousePressed == true && lineDrawn){
      strokeWeight(5);
      stroke(255);
      line(m_mouseOriginX,m_mouseOriginY,mouseX,mouseY);
    }
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    for(int i = 0; i<virusList.size();i++){
      if(virusList.get(i).isHit()){
        m_mouseOriginX = mouseX;
        m_mouseOriginY = mouseY;
        lineDrawn = true;
        m_virusOriginIndex = i;
        virusList.get(i).setClicked(true);
      }
    }
    
  }
}
void mouseReleased() {
    m_mouseOriginX = 0;
    m_mouseOriginY = 0;
    lineDrawn = false;
    virusList.get(m_virusOriginIndex).setClicked(false);
    
    //hit detection/resolve on virusses
    for(int i = 0; i<virusList.size();i++){
      if(virusList.get(i).isHit()){
        transferPower(m_virusOriginIndex,i);
      }
    }
}

void transferPower(int virusOriginIndex, int virusTargetIndex){
  //virus should not transfer power to itself
  if(virusOriginIndex == virusTargetIndex) return;
  println("origin: "+virusOriginIndex);
  println("origin: "+virusTargetIndex);
  
   Virus virusOrigin = virusList.get(virusOriginIndex);
   Virus virusDestiny = virusList.get(virusTargetIndex);
   
   //neutral virus can't transfer anything
   if(virusOrigin.getPower() == 0) return;
   
   int newPower = virusOrigin.getPower()/splitRatio;
   virusOrigin.setPower(newPower);
   virusDestiny.addPower(newPower);
   
   virusDestiny.checkPower();
}

void checkGameOver(){
  int virusType = virusList.get(0).getType();
  for(int i = 0; i<virusList.size();i++){
     if(virusList.get(i).getType() != virusType){
       return;
     }
  }
  gameOver = true;
}

void generateVirusses(int amountNeutral,int amountFriendly,int amountEnemy){
  virusList.clear();
  for(int i = 0;i<amountNeutral;i++){
    virusList.add(new Virus(m_neutral));
  }
  for(int i = 0;i<amountFriendly;i++){
    virusList.add(new Virus(m_friend));
  }
  for(int i = 0;i<amountEnemy;i++){
    virusList.add(new Virus(m_enemy));
  }
}