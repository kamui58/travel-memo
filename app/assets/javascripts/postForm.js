$(function(){
  var elements = document.getElementsByClassName("formBox");


  var x;
  var y;

  for(var i = 0; i < elements.length; i++) {
    elements[i].addEventListener("mousedown", mdown, false);
    elements[i].addEventListener("touchstart", mdown, false);
  }

  function mdown(e){
    this.classList.add("drag");

    if(e.type === "mousedown"){
      var event = e;
    } else {
      var event = e.changedTouches[0];
    }

    x = event.pageX - this.offsetLeft;
    y = event.pageY - this.offsetTop;

    document.body.addEventListener("mousemove", mmove, false);
    document.body.addEventListener("touchmove", mmove, false);
    document.body.addEventListener("mouseup", mup, false);
    document.body.addEventListener("touchend", mup, false);
  }

  function mmove(e) {
    var drag = document.getElementsByClassName("drag")[0];

    if(e.type === "mousemove"){
      var event = e;
    } else {
      var event = e.changedTouches[0];
    }

    e.preventDefault();

    drag.style.top = event.pageY - y + "px";
    drag.style.left = event.pageX - x + "px";

    document.body.addEventListener("mouseleave", mup, false);
    document.body.addEventListener("touchleave", mup, false);
  }

  function mup(e){
    // var drag = document.getElementsByClassName("drag")[0];

    document.body.removeEventListener("mousemove", mmove, false);
    // console.log("1")
    // drag.removeEventListener("mouseup", mup, false);
    // console.log("2")
    document.body.removeEventListener("touchmove", mmove, false);
    // console.log("3")
    // drag.removeEventListener("touchend", mup, false);
    // console.log("4")

    // drag.classList.remove("drag");
  }

});
