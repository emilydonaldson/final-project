// using HYPE Framework by Joshua Davis & James Cruz
// ---> http://www.hypeframework.org/ <---
// ---> github.com / HYPE_Processing <---

import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HOscillator amplifier_wave;
HColorPool colors;


// P3D required for HOscillator
void setup() {
	size( 1200, 800, P3D );
	H.init(this).background(#ffffff).use3D(true);
	smooth();
	lights();


colors = new HColorPool( #FFFF00, #052A61, #43BB74, #FF9C20, #B90A37);

// add new HShapes here (svg files)
	pool = new HDrawablePool(500);

	pool.autoAddToStage()
			.add (	new HShape("pickOne.svg")
							 .size( (int)random(65,500) ) )


			.add (	new HShape("binary.svg")
							.width(65)
							.height(85) )





// dictates layout of oscillation
		.layout (
			new HGridLayout()
			.startX(-200)
			.startY(-50)
			.spacing(150,125)
			.cols(8)
		)


// calls HImage/HShape to put into HOscillator
		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
				HShape s = (HShape) obj;

					s.z(-500);

					s.randomColors( colors.fillOnly() );
					H.add(s);

					new HOscillator()
						.target(s)
						.property(H.SCALE)
						.range(0.5, 1.5)
						.speed(5)
						.freq(3)
						.currentStep( pool.currentIndex()*3 )
					;
				}
			}
		)










		.requestAll();


}

void draw() {

	translate(width, height, -500);
	rotateX(map(mouseY, 0, height, -(TWO_PI / 2), TWO_PI/2));
	rotateY(map(mouseX, 0, width, -(TWO_PI / 2), TWO_PI/2));
	translate(-width, -height, 200);

	H.drawStage();
}

	void keyPressed() {
	if (key == ' ') {
		amplifier_wave.range(-50, 50);
	}
}

void keyReleased(){
	amplifier_wave.range(-100, 100);

}
