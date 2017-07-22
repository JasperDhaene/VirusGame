/* help versie : 
      doel is lijnen trekken, en dan de helft afnemen.
      Op het moment, weet hij -waar- ik klik, maar ik moet een lijn kunnen trekken vanuit dat virus, maar mn click checker valt weg vanaf ik er niet meer op klik.
      
      Aparte timers creëeren als hij split?




*/

ArrayList<Virus> virusList;
public static final int m_neutral = 0;
public static final int m_friend = 1;
public static final int m_enemy = -1;

private float m_mouseOriginX;
private float m_mouseOriginY;

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
  if(mousePressed == true){
    stroke(255);
    line(m_mouseOriginX,m_mouseOriginY,mouseX,mouseY);
  }
}

void mousePressed() {
  if (mouseButton == LEFT) {
    m_mouseOriginX = mouseX;
    m_mouseOriginY = mouseY;
  }
}
void mouseReleased() {
    m_mouseOriginX = 0;
    m_mouseOriginY = 0;
}