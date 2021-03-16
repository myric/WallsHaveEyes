import oscP5.*;
import netP5.*;

OscP5 oscP5;

float dist;

void setup() {
  size(400,400);
  //frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,12000);
}


void draw() {
  background(0);  
  text("distance: " + dist,10,15);
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage message) {
  message.print();
  if(message.checkAddrPattern("/orientation")==true) {
    /* check if the typetag is the right one. -> expecting float (pitch),float (roll), float (yaw)*/
    if(message.checkTypetag("fff")) {
      dist = message.get(0).floatValue();
      //roll  = message.get(1).floatValue();
      //yaw   = message.get(2).floatValue();
    }
  }
}
