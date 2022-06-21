/*	
	_shader_warp // cc alainbrusch.ch + teddavis.org 2020	
	built upon alain's ma thesis » p5shaders.xyz
*/


// define global variables for a texture (tex) and shader (warp)
let tex, warp
var r;
var g;
var b;
var a;

function setup() {
	createCanvas(windowWidth, windowHeight, WEBGL) // Shaders require WEBGL
	background(0)

	pixelDensity(1) // fixes retina display offset
	setAttributes('antialias', true) // toggle depending on display / performance

	// create layer graphics for anything passed into shader
	tex = createGraphics(width, height)
	tex.background(0)

	// load vert/frag defined below
	warp = createShader(vertShader, fragShader)
}


function draw() {
	// draw on layer 'tex' = passed into shader
	r = random(255); // r is a random number between 0 - 255
	g = random(255); // g is a random number betwen 100 - 200
	b = random(255); // b is a random number between 0 - 100
	a = random(230, 255); // a is a random number between 200 - 255
	
	// dots
	tex.stroke(r, g, b, a)
	tex.noFill()
	tex.ellipse(random(width), random(height), random(50, 200))

	// text
	tex.fill(255)
	tex.textSize(tex.width / 5)
	tex.textAlign(CENTER, CENTER)
	tex.text("an2nee", tex.width / 2, tex.height / 2.5)
	
	tex.fill(255)
	tex.textSize(tex.width / 12)
	tex.textAlign(CENTER, CENTER)
	tex.text("creative coding", tex.width / 2, tex.height *0.60)

	
	
	

	// pass required uniforms into shader (Book of Shaders style)
	warp.setUniform("u_texture", tex) // pass tex layer as texture
	warp.setUniform("u_resolution", [width, height]) // pass sketch size as u_resolution

	// pass custom values into shader for smoothCompile live-coding fun (add more!)
	warp.setUniform("u_time", frameCount * 0.05) // pass frameCount as u_time
	warp.setUniform("u_warp", mouseX) // set warp amount
	warp.setUniform("u_distortion", 0.005) // set distortion amount

	shader(warp) // apply shader
	rect(0, 0, width, height) // display shader
}


/* SHADER DEFINITIONS */

// standard p5js vertex shader
let vertShader = `
	attribute vec3 aPosition;
	attribute vec2 aTexCoord;
	varying vec2 vTexCoord;

	void main() {
		vTexCoord = aTexCoord;
		vec4 positionVec4 = vec4(aPosition, 1.0);
		positionVec4.xy = positionVec4.xy * 2.0 - 1.0;
		gl_Position = positionVec4;
	}
`



let fragShader = `
	precision mediump float;
	
	uniform sampler2D u_texture; // our texture passed as p5 layer
	uniform vec2 u_resolution; // viewport resolution (in pixels)
	
	uniform float u_time;  // changes over time using p5 frameCount
	uniform float u_warp;  // warp amount to smoothCompile adjust from draw
	uniform float u_distortion; // distortion amount to smoothCompile adjust from draw
	
	void main() {
		// normalize the frag coordinates based on canvas size
		vec2 uv = gl_FragCoord.xy / u_resolution.xy;
	
		// fix orientation
	    uv.y = 1.0 - uv.y;
	
	    // add movement
	    float v = abs(sin( u_time + uv.x * (uv.y * 1.0) * u_warp) + 1.0) * u_distortion;
	
		// set frag
	    vec3 col = texture2D(u_texture, uv + v).rgb;
	    gl_FragColor = vec4(col, 1.0);
	}
`