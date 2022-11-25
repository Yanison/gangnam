var infrMmSeq = $('#infrMmSeq').val()



const canvas = document.getElementById('canvas'+infrMmSeq);
const ctx = canvas.getContext('2d');

var mtAvatar = new Image();
mtAvatar.src = "../../resources/user/sgworld/images/pepeCrying.png"

const player = {
  w: 10,
  h: 10,
  x: 20,
  y: 100,
  speed: 1.5,
  dx: 0,
  dy: 0,
};

const clear = () => {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
};

const drawPlayer = () => {
  ctx.drawImage(mtAvatar, player.x, player.y, player.w, player.h); // (*)
};

const detectWalls = () => {
  // Left wall
  if (player.x < 0) {
    player.x = 0;
  }
  // Right Wall
  if (player.x + player.w > canvas.width) {
    player.x = canvas.width - player.w;
  }
  // Top wall
  if (player.y < 0) {
    player.y = 0;
  }
  // Bottom Wall
  if (player.y + player.h > canvas.height) {
    player.y = canvas.height - player.h;
  }
};

const newPos = () => {
  player.x += player.dx;
  player.y += player.dy;
  detectWalls();
};

const update = () => {
  clear();
  drawPlayer();
  newPos();
  requestAnimationFrame(update);
};

const moveRight = () => (player.dx = player.speed);
const moveLeft = () => (player.dx = -player.speed);
const moveUp = () => (player.dy = -player.speed);
const moveDown = () => (player.dy = player.speed);

const keyDown = e => {
  if (e.key === 'ArrowRight' || e.key === 'Right') {
    moveRight();
  } else if (e.key === 'ArrowLeft' || e.key === 'Left') {
    moveLeft();
  } else if (e.key === 'ArrowUp' || e.key === 'Up') {
    moveUp();
  } else if (e.key === 'ArrowDown' || e.key === 'Down') {
    moveDown();
  }
};

const keyUp = e => {
  if (
    e.key === 'ArrowRight' ||
    e.key === 'Right' ||
    e.key === 'ArrowLeft' ||
    e.key === 'Left' ||
    e.key === 'ArrowUp' ||
    e.key === 'Up' ||
    e.key === 'ArrowDown' ||
    e.key === 'Down'
  ) {
    player.dx = 0;
    player.dy = 0;
  }
};

update();
document.addEventListener('keydown', keyDown);
document.addEventListener('keyup', keyUp);	