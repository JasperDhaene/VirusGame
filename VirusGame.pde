/* help versie : 
      doel is lijnen trekken, en dan de helft afnemen.
      Op het moment, weet hij -waar- ik klik, maar ik moet een lijn kunnen trekken vanuit dat virus, maar mn click checker valt weg vanaf ik er niet meer op klik.
      
      Aparte timers creëeren als hij split?




*/
//Versie A
Virus v1;

void setup()
{
  size(1200, 600);
  background(0, 0, 0);
  v1 = new Virus();
}



void draw() 
{
  background(0, 0, 0);
  v1.display();
  v1.update();
  v1.virusDetection();
}