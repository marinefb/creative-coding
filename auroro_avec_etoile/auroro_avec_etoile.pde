PGraphics p1;
PGraphics p2;

PShape mol;
bore [] tabAnt = new bore[20];
Courbe [] tabCourbe = new Courbe[4];
float [] tabposeX = {109,-26,9,80};
float [] tabposeY = {-68,-429,113,-30};


Analysor s1;

Courbe c;


void setup() {
 fullScreen (P3D, SPAN);
  //size(1900, 800, P3D);
  background(0);
  s1 = new Analysor(this, "fantasy2.mp3", 60);
  noStroke();
  p1 = createGraphics(width, height, P3D);

  for (int j=0; j<tabCourbe.length;j++){
    
  tabCourbe[j] = new Courbe(random(width), 300, random(1000), 300, 40, j+1);
  }
  
   mol = loadShape("etoilev4.obj");
   mol.disableStyle();
   
  for (int i=0; i<tabAnt.length; i++) {
    tabAnt[i] = new bore(random(width), random(height),mol);
    
  }
  
}


void draw() {
  
  //background(0);
  fill(0,30);
  noStroke();
  rect(0,0,width,height);
  s1.runAnalyse();
  s1.drawPreAnalyse(0, 0, width, 300);
  
  
  for(int a=0;a<40;a++){
    float r=map(s1.getChannel(a),0,1,-10,10);
    
    for (int i=0; i<tabCourbe.length; i++) {
    tabCourbe[i].nombres[a]=r;
    
    fill(0,0);
    color col = color(
    map(a,0,40,0,255),
    map(s1.getChannel(a),0,1,-10,10),
    200,
    80);
   
    
    tabCourbe[i].tabColor[a]=col;
  } 
  
    
    
    //fill(0,20);
  //rect(0,0,width,height);
  lights();
  
  for (int i=0; i<tabAnt.length; i++) {
    tabAnt[i].draw();
  }

}
    
  for (int i=0; i<tabCourbe.length; i++) {
    tabCourbe[i].draw(tabposeX[i],tabposeY[i]);
  } 
  
  
  //c.draw(109,-68);
  
  //c.draw(-26,-429);
  
  
  //c.draw(9,113);
  
}
