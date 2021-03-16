import oscP5.*;
import netP5.*;

OscP5 oscP5;

float dist;

int csize = 50;
int grow = 0;
int n = 0;
int high, low;
int max_dist = 400; //roughly the max that the sensor reads

void setup() {
  size(1000,1000);
  //frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
  
  high = 80;
  low = 50;
  noStroke();
  smooth();
  fill(255, 0, 0);
}


void draw() {
  //background(0);  
  //text("distance: " + dist,15,15);
  
  background(255);
  
  if(n % 60 == 0) {
    grow = 5;
    high = Math.round((max_dist - (int)dist) * 1.5);
    low = Math.round(0.625 * high);
  }
  if(csize > high) {
    csize = high;
    grow = -2;
  }
  if(csize < low) {
    csize = low;
    grow = 0;
  }
  
  ellipse(400, 400, csize, csize);
  
  csize = csize + grow;
  n++;
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage message) {
  message.print();
  if(message.checkAddrPattern("/distance")==true) {
    /* check if the typetag is the right one. -> 1 letter per value coming through*/
    if(message.checkTypetag("f")) {
      dist = message.get(0).floatValue();
      //roll  = message.get(1).floatValue();
      //yaw   = message.get(2).floatValue();
    }
  }
}
