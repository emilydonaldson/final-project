HImage d;

void setup(){
	size(800,800);
	H.init(this).background(#ffffff);
	smooth();

	for (int i = 0; i<100; i++){
		d = new HImage("xx_xy.png");
		d
			.strokeWeight(1)
			.stroke(#FF3300)
			.size( (int)random(25,250) )
			//.rotate( (int)random(360) )
			.loc( (int)random(width), (int)random(height) )
			.anchorAt(H.CENTER);
		H.add(d);
	}

	H.drawStage();
}
