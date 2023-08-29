<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Main Page Banner</title>
<style>
	* {margin:0; padding:0; box-sizing:border-box;}
	ul, li {list-style: none;}
	
	[name="slide"] {display:none;}
	
	.slidebox {
		max-width: 1550px;
		width: 100%;
		margin: 0 auto;
	}
	
	.slidebox img {
		max-width: 100%;
	}
	
	.slidebox .slidelist {
		white-space: nowrap;
		font-size: 0;
		overflow: hidden;
	}
	
	.slidebox .slideitem {
		position: relative;
		display: inline-block;
		vertical-align: middle;
		width: 100%;
		translation: all .15s;
	}
	
	.slidebox .slideitem label {
		position: absolute;
		z-index: 1;
		top: 50%;
		transform: translateY(-50%);
		padding: 20px;
		border-radius: 50%;
		cursor: pointer;
	}
	
	label.left {
		left: 50px;
		background-color: #e9e9e9;
		background-image: url('resources/img/right.png');
		background-position: center center;
		background-size: 50%;
		background-repeat: no-repeat;
	}
	
	label.right {
		right: 50px;
		background-color: #e9e9e9;
		background-image: url('resources/img/left.png');
		background-position: center center;
		background-size: 50%;
		background-repeat: no-repeat;
	}
	
	[id="slide01"]:checked ~ .slidelist .slideitem {transform:translateX(0); animation: slide01 15s infinite;}
	[id="slide02"]:checked ~ .slidelist .slideitem {transform:translateX(-100%); animation: slide01 15s infinite;}
	[id="slide03"]:checked ~ .slidelist .slideitem {transform:translateX(-200%); animation: slide01 15s infinite;}
	[id="slide04"]:checked ~ .slidelist .slideitem {transform:translateX(-300%); animation: slide01 15s infinite;}
	
	@keyframes slide01 {
		0% {left: 0%;}
		23% {left: 0%;}
		25% {left: -100%;}
		48% {left: -100%;}
		50% {left: -200%;}
		73% {left: -200%;}
		75% {left: -300%;}
		98% {left: -300%;}
		100% {left: 0%;}
	}
	
	@keyframes slide02 {
		0% {left: 0%;}
		23% {left: 0%;}
		25% {left: -100%;}
		48% {left: -100%;}
		50% {left: -200%;}
		73% {left: -200%;}
		75% {left: -100%;}
		98% {left: -100%;}
		100% {left: 0%;}
	}
	
	@keyframes slide03 {
		0% {left: 0%;}
		23% {left: 0%;}
		25% {left: -100%;}
		48% {left: -100%;}
		50% {left: -200%;}
		73% {left: -200%;}
		75% {left: -100%;}
		98% {left: -100%;}
		100% {left: 0%;}
	}
	
	@keyframes slide04 {
		0% {left: 0%;}
		23% {left: 0%;}
		25% {left: -100%;}
		48% {left: -100%;}
		50% {left: -200%;}
		73% {left: -200%;}
		75% {left: -100%;}
		98% {left: -100%;}
		100% {left: 0%;}
	}
	
</style>
</head>
<body>
	<div class="slidebox">
		<input type="radio" name="slide" id="slide01" checked>
		<input type="radio" name="slide" id="slide02">
		<input type="radio" name="slide" id="slide03">
		<input type="radio" name="slide" id="slide04">
		<ul class="slidelist">
			<li class="slideitem">
				<div>
					<label for="slide04" class="left"></label>
					<label for="slide02" class="right"></label>
					<a><img src="resources/img/banner3.jpg"></a>
				</div>
			</li>
			<li class="slideitem">
				<div>
					<label for="slide01" class="left"></label>
					<label for="slide03" class="right"></label>
					<a><img src="resources/img/banner2.jpg"></a>
				</div>
			</li>
			<li class="slideitem">
				<div>
					<label for="slide02" class="left"></label>
					<label for="slide04" class="right"></label>
					<a><img src="resources/img/banner1.png"></a>
				</div>
			</li>
			<li class="slideitem">
				<div>
					<label for="slide03" class="left"></label>
					<label for="slide01" class="right"></label>
					<a><img src="resources/img/banner4.jpg"></a>
				</div>
			</li>
		</ul>
	</div>
</body>
</html>