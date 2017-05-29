// var btn = document.getElementById('btn');

// btn.addEventListener('click', function() {
//   var myRequest = new XMLHttpRequest();
//   myRequest.open('GET', 'https://learnwebcode.github.io/json-example/animals-1.json')
//   myRequest.onload = function() {
//     var myData = JSON.parse(myRequest.responseText); 
//     console.log(myData[0]);
//   };
//   myRequest.send();
// })





const btn = document.getElementById('btn');
const animalContainer = document.getElementById('animal-info');
// Create a page counter to alter the url each time.
let pageCounter = 1;

const callback1 = function() {
  const myRequest = new XMLHttpRequest();
  myRequest.open('GET', 'https://learnwebcode.github.io/json-example/animals-'+ pageCounter + '.json')
  myRequest.onload = function() {
    if (myRequest.status >= 200 && myRequest.status < 400) {
      var myData = JSON.parse(myRequest.responseText);
      renderHTML(myData);
    } else {
      console.log("We connected to the server, but it returned an error.");
    }
  };

  myRequest.onerror = function() {
    console.log("Connection error");
  };

  myRequest.send();
  // increment the url destination 
  pageCounter++;
  // note that after 3 clicks there are no more data at 4 and above.
  if (pageCounter > 3) {
    btn.classList.add('hide-me');
  }
};


const renderHTML = function(data) {
  let htmlStr = '';
  let i, j;
  let l = data.length;

  for (i = 0; i < l; i++) {
    htmlStr += '<p>' + data[i].name + ' is a ' + data[i].species + ' that likes to eat ';

    let m = data[i].foods.likes.length
    for (j = 0; j < m; j++) {
      if (j == 0) {
        htmlStr += data[i].foods.likes[j];
      } else {
        htmlStr += ' and ' + data[i].foods.likes[j];
      }
    }

    htmlStr += ' and dislikes ';

    let n = data[i].foods.dislikes.length;
    for (j = 0; j < n; j++) {
      if (j == 0) {
        htmlStr += data[i].foods.dislikes[j];
      } else {
        htmlStr += " and " + data[i].foods.dislikes[j];
      }
    }

    htmlStr += '.</p>';

  }
  animalContainer.insertAdjacentHTML('beforeend', htmlStr)
}


btn.addEventListener('click', callback1);