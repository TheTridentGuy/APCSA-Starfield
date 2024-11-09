int width = 500;
int height = 500;
int particle_d = 5;


Particle[] p = new Particle[300];
void setup()
{
  size(500, 500);
  for(int i=0;i<p.length-1;i++){
    p[i] = new Particle(width/2, height/2, Math.random()*360, Math.random()*10);
  }
  p[p.length-1] = new HighEnergyParticle(width/2, height/2, Math.random()*360, Math.random()*10);
}

void draw()
{
  background(0);
  for(Particle part: p){
    part.move();
    part.show();
    // TODO: make bounds circular
    if((part.x<0||part.x>width)||(part.y<0||part.y>height)){
      part.x = width/2;
      part.y = height/2;
    }
  }
}

class Particle
{
  double x, y, angle, speed;
  Particle(double x, double y, double angle, double speed){
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.speed = speed;
  }
  
  void move(){
    this.x += Math.cos(this.angle)*this.speed;
    this.y += Math.sin(this.angle)*this.speed;
  }
  
  void show(){
    fill(255,255,255);
    ellipse((float)x,(float)y,particle_d,particle_d);
  }
}

class HighEnergyParticle extends Particle
{
  HighEnergyParticle(double x, double y, double angle, double speed){
    super(x,y,angle,speed);
  }
  
  void move(){
    super.move();
    this.angle += Math.random()*10;
  }
  
  void show(){
    fill(255,0,0);
    ellipse((float)x,(float)y,particle_d*2,particle_d*2);
  }
}
