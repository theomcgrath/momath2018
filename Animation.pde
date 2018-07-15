public static class Animation extends WallAnimation {

  // First, we add metadata to be used in the MoMath system. Change these
  // strings for your behavior.
  String behaviorName = "Wave Interference";
  String author = "Theo McGrath";
  String description = "This exhibit displays a sine wave propagating through the wall and being damped. It starts at the left side moving to the right and then reflects off of the right side of the wall, creating an interference pattern with itself.";

  // Now we initialize a few helpful global variables.
  int wallLength = 128;
  int time = 0;
  int wavelength = 16;
  int speed = 2;
  float dampen = 0.02;
  
  // The setup block runs at the beginning of the animation. You could
  // also use this function to initialize variables, load data, etc.
  void setup() {
  }		 

  // The update block will be repeated for each frame. This is where the
  // action should be programmed.
  void update() {  
    for (int index = 0; index < time && index < wallLength; index++) {     
        int wavePos1 = (index-time) % wallLength;     
        float topPos1 = (sin(PI*(wavePos1+(wavelength/2))/(wavelength))+1)/(2+index*dampen);
        float botPos1 = (cos(PI*(wavePos1+(wavelength/2))/(wavelength))+1)/(2+index*dampen);    
        int wavePos2 = 0;
        float topPos2 = 0;
        float botPos2 = 0;
        if (time > wallLength && wallLength*2-index < time) {
          wavePos2 = (index+time) % wallLength;
          topPos2 = (sin(PI*(wavePos2+(wavelength/2))/(wavelength))+1)/(2+(wallLength*2-index)*dampen);
          botPos2 = (cos(PI*(wavePos2+(wavelength/2))/(wavelength))+1)/(2+(wallLength*2-index)*dampen);
        }    
        DWSlat slat = wall.slats[index];
        slat.setTop(topPos1+topPos2);
        slat.setBottom(botPos1+botPos2);
    }
     time += speed; 
  }

  // Leave this function blank
  void exit() {
  }
  
  // You can ignore everything from here.
  String getBehaviorName() {
    return behaviorName;
  }
  
  String getAuthorName() {
    return author;
  }
  
  String getDescription() {
    return description;
  }
  
}