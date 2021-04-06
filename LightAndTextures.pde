PShape table, glasses, cap, tree, pot, necklace, walls;
PImage wall;

boolean rotLeft, rotRight, incRed, decRed, incGreen, decGreen, incBlue, decBlue, flash, menu;
int ang, size, red, green, blue;

void setup() {
  size(1500, 1000, P3D);
  colorMode(RGB, 255, 255, 255);

  table = loadShape("Shapes/10256_TV_Cabinet_v1_max2011.obj");
  glasses = loadShape("Shapes/oculos.obj");
  cap = loadShape("Shapes/10131_BaseballCap_v2_L3.obj");
  tree = loadShape("Shapes/Lowpoly_tree_sample.obj");
  pot = loadShape("Shapes/15988_Flower_Pot_v1.obj");
  necklace = loadShape("Shapes/13553_Plastic_Beaded_Necklace-medium_v1_L1.obj");

  wall = loadImage("Textures/wall.jpg");

  ang = 360;
  red = 128;
  green = 128;
  blue = 128;

  rotLeft = false;
  rotRight = false;
  incRed = false;
  decRed = false;
  incGreen = false;
  decGreen = false;
  incBlue = false;
  decBlue = false;
  flash = false;
  
  menu = false;
  
  stroke(255);
  textSize(30);
}

void draw() {

  if (menu) {
    background(0);
    
    text("Press A and D to rotate the furniture\nPress SPACE to flash the furniture\nPress U and J to increase/decrease the Red value of the light\nPress I and K to increase/decrease the Green value of the light\nPress O and L to increase/decrease the Blue value of the light\nPress R to reset to the starting point\nPress TAB to close this menu", 20, 40);
    
  } else {

    background(56);
    text("Press TAB to open the control menu", 20, 40);
    translate(width/2, height/2, 700);
    ambientLight(10, 10, 10);
    directionalLight(50, 50, 50, 0, 1, 0);
    

    if (flash) {
      directionalLight(red, green, blue, 0, 0, -1);
    }

    rotateY(radians(ang));

    if (rotLeft) {
      ang ++;
      if (ang == 360) {
        ang = 0;
      }
    } else if (rotRight) {
      ang --;
      if (ang == 0) {
        ang = 360;
      }
    }

    if (incRed) {
      red += 1;
      if (red == 256) {
        red = 255;
      }
    } else if (decRed) {
      red -= 1;
      if (red == -1) {
        red = 0;
      }
    }

    if (incGreen) {
      green += 1;
      if (green == 256) {
        green = 255;
      }
    } else if (decGreen) {
      green -= 1;
      if (green == -1) {
        green = 0;
      }
    }

    if (incBlue) {
      blue += 1;
      if (blue == 256) {
        blue = 255;
      }
    } else if (decBlue) {
      blue -= 1;
      if (blue == -1) {
        blue = 0;
      }
    }
    generateFurniture();
  }
}

void keyPressed() {
  if (key == 'a') {
    rotLeft = true;
  }
  if (key == 'd') {
    rotRight = true;
  }
  if (key == 'u') {
    incRed = true;
  }
  if (key == 'j') {
    decRed = true;
  }
  if (key == 'i') {
    incGreen = true;
  }
  if (key == 'k') {
    decGreen = true;
  }
  if (key == 'o') {
    incBlue = true;
  }
  if (key == 'l') {
    decGreen = true;
  }
  if (key == ' ') {
    flash = true;
  }
}

void keyReleased() {
  if (key == 'a') {
    rotLeft = false;
  }
  if (key == 'd') {
    rotRight = false;
  }
  if (key == 'u') {
    incRed = false;
  }
  if (key == 'j') {
    decRed = false;
  }
  if (key == 'i') {
    incGreen = false;
  }
  if (key == 'k') {
    decGreen = false;
  }
  if (key == 'o') {
    incBlue = false;
  }
  if (key == 'l') {
    decGreen = false;
  }
  if (key == ' ') {
    flash = false;
  }
  if (keyCode == TAB){
    menu = !menu;
  }
  if (key == 'r'){
    setAll();
  }
}

void generateFurniture() {
  pushMatrix();
  translate(0, 90, 0);
  rotateY(radians(180));
  rotateX(radians(90));
  ambient(10);
  shininess(40);
  shape(table);
  popMatrix();

  pushMatrix();
  translate(-40, 29, 10);
  rotateZ(radians(180));
  rotateY(radians(-45));
  shininess(70);
  scale(10);
  shape(glasses);
  popMatrix();

  pushMatrix();
  translate(40, 25, -10);
  rotateX(radians(90));
  rotateZ(radians(20));
  shininess(10);
  shape(cap);
  popMatrix();

  pushMatrix();
  translate(-5, 21, -5);
  rotateX(radians(180));
  shininess(70);
  shape(tree);
  popMatrix();

  pushMatrix();
  translate(-6, 31, -10);
  rotateX(radians(90));
  shininess(20);
  scale(3);
  shape(pot);
  popMatrix();

  pushMatrix();
  translate(10, 31, 15);
  rotateX(radians(90));
  rotateZ(36);
  shininess(100);
  scale(2);
  shape(necklace);
  popMatrix();
}

void setAll(){
  ang = 360;
  red = 128;
  green = 128;
  blue = 128;

  rotLeft = false;
  rotRight = false;
  incRed = false;
  decRed = false;
  incGreen = false;
  decGreen = false;
  incBlue = false;
  decBlue = false;
  flash = false;
}
