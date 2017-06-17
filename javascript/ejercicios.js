function reverseNumbre(num) {
  parseInt(String(num).split("").reverse().join(""), 10)
}

function eachWordToUppercase(str) {
  upp = str.split(' ').map(function (word) {
    return word.charAt(0).toUpperCase() + word.slice(1)
  }).join(' ')
  return upp
}


var library = [
  {
    title: 'Bill Gates',
    author: 'The Road Ahead',
    wasRead: true
  },
  {
    title: 'Steve Jobs',
    author: 'Walter Isaacson',
    wasRead: true
  },
  {
    title: 'Mockingjay: The Final Book of The Hunger Games',
    author: 'Suzanne Collins',
    wasRead: false
  }
]

function unRead?(arr) {
  var unR = []
  arr.each(function (book) {
    if (!book.wasRead) { unR.push(book) }
  })
}

function clear(arr) {
  while (arr.length) {
    arr.pop()
  }
  // arr.splice(0, arr.length) solución 1
  // arr.length = 0  solución 2
}

var student = {
  name: 'David Rayy',
  sclass: 'VI',
  rollno: 12,
  birthdate: new Date()
}