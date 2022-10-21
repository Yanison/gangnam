// canvas.js

/*
	canvas
*/

const canvas = document.getElementById("canvas");
let ctx = canvas.getContext("2d");

// size
canvas.width = window.innerWidth - 100;
canvas.height = window.innerHeight - 100;


// style
//ctx.fillStyle = '#2F2F2F';
//ctx.fillRect(0, 0, canvas.width, canvas.height);

// 캐릭터 js object
let image1 = new Image();
image1.src = "player.png";

let character = {
	x : 10,			// x 좌표
	y : 200,		// y 좌표
	width : 50,		// 캐릭터 너브
	height : 50,	// 캐릭터 높이
	draw() {
		ctx.fillStyle = 'yellow';
		ctx.fillRect(this.x, this.y, this.width, this.height);
		drawOnImage(image1, this.x, this.y, this.width, this.height);
	}
}

character.draw();

//image load 후 draw
function drawOnImage(image,x,y,w,h) {
	image.onload = function() {
		ctx.drawImage(image, x, y, w, h);
	}
}


/*
FPS animation
*/
let timer = 0;
let animation;
let up, down, left, right;

function frameAnimation() {
	animation = requestAnimationFrame(frameAnimation)
	timer ++;
	
	ctx.clearRect(0, 0, canvas.width, canvas.height)
	ctx.fillStyle = '#2F2F2F';
	ctx.fillRect(0, 0, canvas.width, canvas.height);
	
	if(up) {
		up = false;
		character.y -= 15;
	}
	if(down) {
		down = false;
		character.y += 15;
	}
	if(left) {
		left = false;
		character.x -= 15;
	}
	if(right) {
		right = false;
		character.x += 15;
	}
	character.draw();
	if(timer == 5000) cancelAnimationFrame(animation);
}
frameAnimation();

/*
key event
*/
document.addEventListener('keydown', function(e) {
	console.log(e.code)
	if(e.code == 'ArrowUp') {
		up = true;
	} else if(e.code == 'ArrowDown') {
		down = true;
	} else if(e.code == 'ArrowLeft') {
		left = true;
	} else if(e.code == 'ArrowRight') {
		right = true;
	}
})


