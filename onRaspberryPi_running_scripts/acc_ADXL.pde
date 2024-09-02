import processing.serial.*;

// Variables for serial communication
Serial myPort;
float xAcc = 0;
float yAcc = 0;
float zAcc = 0;

void setup() {
  // Set up the sketch window
  size(1600, 1200, P3D);
  
  // Initialize serial communication at 115200 baud rate
  String portName = Serial.list()[1]; // Adjust the index if needed
  myPort = new Serial(this, portName, 115200);
  myPort.bufferUntil('\n');
}

void draw() {
  // Set background color and reset transformations
  background(100);
  lights();
  
  // Translate and rotate according to acceleration data
  translate(width/2, height/2, 0);
  
  // Tilt the plane according to the received acceleration values
  // Rotate around the X-axis (pitch) based on y-axis acceleration
  rotateX(radians(-yAcc * 90));
  
  // Rotate around the Z-axis (roll) based on x-axis acceleration
  rotateZ(radians(-xAcc * 90));
  
  // Draw the 3D plane
  scale(3);
  drawPlane();
}

void drawPlane() {
  // Draw a simple 3D airplane
  
  // Fuselage (Body of the plane)
  fill(200, 0, 0);
  beginShape(QUADS);
  vertex(-20, -5, 60); // Rear left
  vertex(20, -5, 60);  // Rear right
  vertex(20, -5, -60); // Front right
  vertex(-20, -5, -60);// Front left
  
  vertex(-20, 5, 60);  // Rear left bottom
  vertex(20, 5, 60);   // Rear right bottom
  vertex(20, 5, -60);  // Front right bottom
  vertex(-20, 5, -60); // Front left bottom
  
  vertex(-20, -5, 60);
  vertex(-20, 5, 60);
  vertex(-20, 5, -60);
  vertex(-20, -5, -60);
  
  vertex(20, -5, 60);
  vertex(20, 5, 60);
  vertex(20, 5, -60);
  vertex(20, -5, -60);
  endShape();
  
  // Wings
  fill(0, 0, 200);
  beginShape();
  vertex(-80, 0, 0);   // Left wing tip
  vertex(80, 0, 0);    // Right wing tip
  vertex(20, 0, -20);  // Right wing near fuselage
  vertex(-20, 0, -20); // Left wing near fuselage
  endShape(CLOSE);
  
  // Tail
  fill(0, 200, 0);
  beginShape();
  vertex(-15, 0, 60);  // Tail bottom left
  vertex(15, 0, 60);   // Tail bottom right
  vertex(0, -20, 40);  // Tail top
  endShape(CLOSE);
}

void serialEvent(Serial myPort) {
  // Read the serial buffer until a newline character
  String data = myPort.readStringUntil('\n');
  if (data != null) {
    // Trim the data and split into parts
    data = data.trim();
    String[] parts = data.split(" ");
    
    // Parse the acceleration data from the received data
    if (parts.length == 3) {
      xAcc = float(parts[0]);
      yAcc = float(parts[1]);
      zAcc = float(parts[2]);
    }
  }
}
