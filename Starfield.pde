//Mongus

Particle[] nancy = new Particle[100];
void setup(){
  size(400,400);
  noStroke();
  for (int i = 0; i < nancy.length; i++){
    nancy[i] = new Particle();
  }
  nancy[99] = new Oddball();
  
}

void draw(){
  background(0);
  for (int i = 0; i < nancy.length; i++){
    nancy[i].move();
    nancy[i].detectOffscreen();
    nancy[i].show();
  }
  //fill(255,0,0); //red dot shows center of screen
  //ellipse(200,200,5,5);
}


class Particle{
  double x,y, ang, spd, ops;
  Particle(){
    x = 200;
    y = 200;
    ang = (Math.random()*(2*Math.PI));
    spd = Math.random()*3;
    ops = 0;
  }
  
  void move(){
    x+= Math.cos(ang)*spd;
    y+= Math.sin(ang)*spd;
    spd += 0.01;
    ops += ops/100 +spd; //LOOKS REALLY NEAT HOLY COW oh capslock
  }
  
  void show(){
    fill(255, (float)ops);
    ellipse((float)x,(float)y,7+(float)ops/100,7+(float)ops/100);
    if (7+(float)ops/100 > 100){
      System.out.println(x +""+ y);
    }
  }
  
  void detectOffscreen(){
    if (x < -50 || y < -50 || x > 450 || y > 450){
      x = (Math.random()*20)+190;
      y = (Math.random()*20)+190;
      if (Math.random() < 0.5){ // randomly judges x or y(like just x beter but keep fornow)
        if (x > 200){ //to prevent those spawning on the right from going to the left 
          ang = (Math.random()*(Math.PI))-Math.PI/2;
        } else{ //vice versa
          ang = (Math.random()*(Math.PI))+Math.PI/2;
        }
      } else{
        if (y > 200){ //to prevent those spawning on the bottom from going to the top 
          ang = (Math.random()*(Math.PI))-Math.PI;
        } else{ //vice versa
          ang = (Math.random()*(Math.PI));
        }
      }
      spd = Math.random()*3;
      ops = 0;
    }
  }
  
}

class Oddball extends Particle{
  Oddball(){
    x = 200;
    y = 200;
    ang = (Math.random()*(2*Math.PI));
    spd = Math.random()*3;
    ops = 0;
  }
  
  void show(){
    pushMatrix();
    //rotate((float)ang/10);     //FIX ROTATION!!!!
    fill(255, 0, 0, (float)ops);
    
    beginShape();
    vertex((float)x+13,(float)y+7.5);
    vertex((float)x+13,(float)y+22);
    vertex((float)x+7,(float)y+22);
    vertex((float)x+6.5,(float)y+20);
    vertex((float)x+6,(float)y+22);
    vertex((float)x,(float)y+22);
    vertex((float)x,(float)y+6.8);
    endShape();
    bezier((float)x,(float)y+6.8,(float)x+1.5,(float)y,(float)x+11.5,(float)y,(float)x+13,(float)y+7.5); //head
    bezier((float)x,(float)y+22,(float)x+1.5,(float)y+25,(float)x+4.5,(float)y+25,(float)x+6,(float)y+22);  //L leg
    bezier((float)x+7,(float)y+22,(float)x+8.5,(float)y+25,(float)x+11.5,(float)y+25,(float)x+13,(float)y+22); // R leg
    bezier((float)x+13,(float)y+7.5,(float)x+17.5,(float)y+5.5,(float)x+17.5,(float)y+21.5,(float)x+13,(float)y+19.5); //bpack
    fill(50,200,255,(float)ops);
    ellipse((float)x+3,(float)y+9.5,11.5,6);
    popMatrix();
  }
}





