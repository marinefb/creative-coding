class bore {
  float x;
  float y;
  float vx=random(-1, 1);
  float vy=random(-1, 1);
  color col;
  int t=0;
  int tMax=int(random(100, 200));
  PShape mol;

  float ry;

  bore(float cx, float cy, PShape mol) {
    x=cx;
    y=cy;
    this.mol=mol;
    col = color(255);
  }
  void draw() {
    x+=vx;
    y+=vy;

    pushMatrix();
    translate(x, y,40);
    //rotateZ(PI);
    rotateY(ry);

    shape(mol, 0, 0);
    fill(255);
    
    popMatrix();

    if (x>width || x<0)vx*=-1;
    if (y>height || y<0)vy*=-1;
    if (t>tMax) {
      vx=random(-0.1, 0.1);
      vy=random(-0.1, 0.1);
      t=0;
      tMax=int(random(8000, 2000));
    }
    t++;
    ry += 0.001;
  }
}
