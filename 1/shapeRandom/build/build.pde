// using HYPE Framework by Joshua Davis & James Cruz
// ---> http://www.hypeframework.org/ <---
// ---> github.com / HYPE_Processing <---



import processing.pdf.*;
boolean record = false;

HShape d;
HShape v;
HShape l;
HColorPool colors;

void setup(){
	size(1200,800);
	H.init(this).background(#FFFFFF);
	smooth();

// grey colour palette
	// colors = new HColorPool(#FFFFFF, #D3D3D3, #C0C0C0, #8F8787);

//blue, green, yellow, orange & red colour palette
	colors = new HColorPool( #FFFF00, #052A61, #43BB74, #FF9C20, #B90A37 );


	for (int i = 0; i<25; i++){
		v = new HShape("body.svg");
		v
			.enableStyle(false)
			.stroke(#111111)
			.rotation( (int)random(360) )
			.size( (int)random(5,500) )
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER);

		// must cancel out below if using HImage
		// this fills SVGs w colours dictated in HColorPool
		v.randomColors( colors.fillOnly() );
		H.add(v);
	}


	for (int i = 0; i<15; i++) {
		l = new HShape("body2.svg");
		l
			.enableStyle(false)
			.stroke(#111111)
			.rotation( (int)random(360) )
			.size( (int)random(100,250) )
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER);

		l.randomColors( colors.fillOnly() );
		H.add(l);
	}

	for (int i = 0; i<1; i++){
		d = new HShape("pickOneSep.svg");
		d
			.enableStyle(false)
			.stroke(#111111)
			.size( (int)random(5,500) )
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER);

		H.add(d);
	}

}

void draw() {
	PGraphics tmp = null;

// saves image as PDF file
	if (record) {
		tmp = beginRecord(PDF, "render-######.pdf");
	}

// drawing the bg???
	if (tmp == null) {
		H.drawStage();
	} else {
		PGraphics g = tmp;
		boolean uses3D = false;
		float alpha = 1;
		H.stage().paintAll(g, uses3D, alpha);
	}

	if (record) {
		endRecord();
		record = false;
	}
}

// hit 's' key to save as PDF
void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
