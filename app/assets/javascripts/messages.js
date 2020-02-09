$(function(){
  // var elements = document.getElementsByClassName("drag-and-drop");
  var elements = document.getElementsByClassName("formBox");


  var x;
  var y;

  for(var i = 0; i < elements.length; i++) {
    elements[i].addEventListener("mousedown", mdown, false);
    // elements[i].addEventListener("touchstart", mdown, false);
  }

  function mdown(e){
    console.log("押した")
    this.classList.add("drag");

    if(e.type === "mousedown"){
      var event = e;
    } else {
      var event = e.changedTouches[0];
    }

    x = event.pageX - this.offsetLeft;
    y = event.pageY - this.offsetTop;

    // ここに"mousedown"から"mouseleave"離した時の処理を入れたい
    // ここにif文を入れて、"mouseup"した場合の処理を入れればいいのでは？
    document.body.addEventListener("mousemove", mmove, false);
    // document.body.addEventListener("touchmove", mmove, false);
  }

  function mmove(e) {
    console.log("動かした")
    var drag = document.getElementsByClassName("drag")[0];

    if(e.type === "mousemove"){
      var event = e;
    } else {
      var event = e.changedTouches[0];
    }

    e.preventDefault();

    drag.style.top = event.pageY - y + "px";
    drag.style.left = event.pageX - x + "px";

    drag.addEventListener("mouseup", mup, false);
    document.body.addEventListener("mouseleave", mup, false);
    // drag.addEventListener("touchend", mup, false);
    // document.body.addEventListener("touchleave", mup, false);
  }

  function mup(e){
    console.log("置いた")
    var drag = document.getElementsByClassName("drag")[0];

    document.body.removeEventListener("mousemove", mmove, false);
    drag.removeEventListener("mouseup", mup, false)
    // document.body.removeEventListener("touchmove", mmove, false);
    // drag.removeEventListener("touchend", mup, false);

    drag.classList.remove("drag");
  }

});