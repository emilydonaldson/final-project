// using HYPE Framework by Joshua Davis & James Cruz
// ---> http://www.hypeframework.org/ <---
// ---> github.com / HYPE_Processing <---

import processing.pdf.*;
boolean record = false;

HDrawablePool pool;
HOscillator amplifier_wave;


// P3D required for HOscillator
void setup() {
	size( 1200, 800, P3D );
	H.init(this).background(#ffffff).use3D(true);
	smooth();
	lights();

// add new HShapes here (svg files)
	pool = new HDrawablePool(500);

	pool.autoAddToStage()
			// .add (	new HShape("pickOne.svg")
			// 				 .width( 65 )
			// 				 .height( 65 )		)


			.add (	new HImage("they.png")
							.width(630)
							.height(52) )

			.add (	new HImage("gender.png")
							.width(1290)
							.height(240) )

			.add (	new HImage("neutral.png")
							.width(470)
							.height(54) )

			.add (	new HImage("femaleOrMale.png")
							.width(350)
							.height(68) )

			.add (	new HImage("studentGender.png")
							.width(836)
							.height(348) )

			.add (	new HImage("preferredPronouns.png")
							.width(214)
							.height(40) )





// dictates layout of oscillation
		.layout (
			new HGridLayout()
			.startX(-125)
			.startY(-100)
			.spacing(125,100)
			.cols(10)
		)


// calls HImage/HShape to put into HOscillator
		.onCreate (
			 new HCallback() {
				public void run(Object obj) {
				HImage s = (HImage) obj;
				//	HShape s = (HShape) obj;

					s.z(-500);

					new HOscillator()
						.target(s)
						.property(H.SCALE)
						.range(0.5, 1.5)
						.speed(1)
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
