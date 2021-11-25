let ws = new WebSocket("ws://localhost:8880/DoAnIMessage/call/1");
ws.binaryType = "arraybuffer";
ws.onmessage = function (event) {
	convertToAudio(event);
}
let AudioContext = window.AudioContext || window.webkitAudioContext;
let audioCtx = new AudioContext();
function record() {
	constraints = { audio: true };
	navigator.mediaDevices.getUserMedia(constraints).then((stream) => {
	    let source = audioCtx.createMediaStreamSource(stream);
	    audioCtx.audioWorklet.addModule("audio-processor.js").then(() => {
	        const customAudioProcessor = new AudioWorkletNode(audioCtx, "audio-processor");
	        customAudioProcessor.socket = ws;
	        customAudioProcessor.port.onmessage = sendToServer;
	        //customAudioProcessor.recording = true;
			var dest = audioCtx.createMediaStreamDestination();
	        source.connect(customAudioProcessor).connect(dest);
			let video = document.getElementById("localStream");
			video.srcObject = dest.stream;
	    });
	});
}
let index = 1;
let leftChannel = new Float32Array(3840);
let rightChannel = new Float32Array(3840);
let count = 0;
let asource;
let time = 0;
function sendToServer(event){
	let array = event.data;
	console.log(event);
	ws.send(array[0].buffer);
}
function convertToAudio(event) {
	//console.log(event);
	let array = event.data;
	let floatArray = new Float32Array(array);
	if (time == 0){
		time = audioCtx.currentTime;
	}
	if (count <= 29){
		leftChannel.set(floatArray,count*128);
		count++;
	}
	if (count == 30){
		count = 0;
		let myArrayBuffer = audioCtx.createBuffer(1, 3840, audioCtx.sampleRate);
		myArrayBuffer.copyToChannel(leftChannel,0,0);
		time += 0.03;
		playSound(myArrayBuffer,time);
		leftChannel = new Float32Array(3840);
		rightChannel = new Float32Array(3840);
	}
	/*
	let source = aCtx.createBufferSource();
	aCtx.decodeAudioData(buffer).then((audio) => {
		source.buffer = audio;
		source.connect(aCtx.destination);
		source.start();
	});
	*/
}
function playSound(buffer, playTime) {
	var source = audioCtx.createBufferSource();
	source.buffer = buffer;
	source.start(playTime);
	source.connect(audioCtx.destination);
}