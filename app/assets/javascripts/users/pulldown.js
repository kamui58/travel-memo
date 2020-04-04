$(function () {
  var html = `
  <ul class='messageFormBtn'>
    <li class='messageFormBtn__list'>
      <a class='listContent'>削除</a>
      <a class='listContent'>編集</a>
    </li>
  </ul>
  `;

  var pulldownSelect = document.getElementsByClassName('pulldownSelect');
  var pullId = "pull_id"
  for (let i = 0; i < pulldownSelect.length; i++) {
    pulldownSelect[i].addEventListener('click', function () {
      pulldownSelect[i].setAttribute("id", pullId + i);
      // console.log(pulldownSelect[i]);
      pulldownSelect[i].insertAdjacentHTML('beforeend', html);
    });
  }
});