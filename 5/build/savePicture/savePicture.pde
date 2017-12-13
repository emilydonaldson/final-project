import processing.pdf.*;
boolean record = false;

HShape d;
HColorPool colors;

void setup(){
	size(600, 600, P3D);
	H.init(this).background(#ffffff).use3D(true);
	smooth();

	colors = new HColorPool(#D95E89, #E865BA, #FF74F9, #EC74FF, #D370FF); //#00616f, #FF3300, #FF6600);

	for (int i = 0; i<150; i++){
		d = new HShape("binary.svg");
		d
		.width( (int)random(25,125) )
		.height( (int)random(25,125) )
		//	.enableStyle(false)
			.stroke(#111111)
			.strokeJoin(ROUND)
			.strokeCap(ROUND)
			.rotation( (int)random(360) )
			.size( (int)random(25,500) )
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER)
		;

		d.randomColors( colors.fillOnly() );
		H.add(d);
	}
}

void draw() {
	PGraphics tmp = null;

	if (record) {
		tmp = beginRecord(PDF, "render-######.pdf");
	}

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

void keyPressed() {
	if (key == 's') {
		record = true;
		draw();
	}
}
