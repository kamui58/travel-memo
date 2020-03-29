$(function(){
  var pulldownSelect = document.getElementsByClassName('pulldownSelect');
  for(let i = 0; i < pulldownSelect.length; i++){
    pulldownSelect[i].addEventListener('mouseover', function () {
      alert('alert!');
    });
  }
});
