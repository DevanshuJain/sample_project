// TweenMax.ticker.fps(5);
var tl = new TimelineMax({repeat:2, repeatDelay:1, delay:1});
tl.add( TweenMax.to('#ad .copy1', 1, {top: 0}) );
tl.add( TweenMax.to('#ad .chip', 1, {bottom: 0}) );
tl.add( TweenMax.to('#ad .button', 1, {opacity: 1}) );
var count = 0;
tl.call(function(){
	if(count===2){
		tl.pause();
	}else{
		tl.play();
	}
	count++;
});
tl.add( TweenMax.to('#ad .copy1, #ad .chip, #ad .button', 1, {opacity: 0, delay:3}));