
ArrayList<Virus> virusList;
public static final int m_neutral = 0;
public static final int m_friend = 1;
public static final int m_enemy = -1;

private float m_mouseOriginX;
private float m_mouseOriginY;

private boolean lineDrawn;

private int m_virusOriginIndex;

public static final int splitRatio = 2;

void setup()
{
  size(1200, 600);
  background(0, 0, 0);
  virusList = new ArrayList<Virus>();
  virusList.add(new Virus(m_neutral));
  virusList.add(new Virus(m_friend));
  virusList.add(new Virus(m_enemy));
}



void draw() 
{
  background(0, 0, 0);
  update();
  render();
  
}

private void update(){
  //render virusses
  for(int i = 0; i<virusList.size();i++){
    virusList.get(i).update();
  }
}

private void render(){
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

void mousePressed() {
  if (mouseButton == LEFT) {
    for(int i = 0; i<virusList.size();i++){
      if(virusList.get(i).isHit()){
        m_mouseOriginX = mouseX;
        m_mouseOriginY = mouseY;
        lineDrawn = true;
        m_virusOriginIndex = i;
      }
    }
    
  }
}
void mouseReleased() {
    m_mouseOriginX = 0;
    m_mouseOriginY = 0;
    lineDrawn = false;
    
    //hit detection/resolve on virusses
    for(int i = 0; i<virusList.size();i++){
      if(virusList.get(i).isHit()){
        transferPower(m_virusOriginIndex,i);
      }
    }
}

void transferPower(int virusOriginIndex, int virusDestinyIndex){
  //virus should not transfer power to itself
  if(virusOriginIndex == virusDestinyIndex) return;
  
   Virus virusOrigin = virusList.get(virusOriginIndex);
   Virus virusDestiny = virusList.get(virusDestinyIndex);
   
   //neutral virus can't transfer anything
   if(virusOrigin.getPower() == 0) return;
   
   int newPower = virusOrigin.getPower()/splitRatio;
   virusOrigin.setPower(newPower);
   virusDestiny.addPower(newPower);
   
   virusDestiny.checkPower();
}