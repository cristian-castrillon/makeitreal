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

function User(name, email) {
  this.name = name
  this.email = email

  this.getName = function() {
    return this.name
  }
}

User.prototype.getEmail = function() {
  return this.email
};

Array.prototype.average = function() {
  var avg = 0
  this.forEach(function(num) {
    avg += num
  })
  return avg / this.length
};

var comment = {
  title: '',
  content: '',
  titleCapitalized: function(){
    return this.title.toUpperCase()
  }
}

var fullname = 'John Doe';
var obj = {
  fullname: 'Colin Ihrig',
  prop: {
    fullname : 'Aurelio De Rosa',
    getFullname: function() {
      return this.fullname;
    }
  }
};

console.log(obj.prop.getFullname()); // 'Aurelio De Rosa'
////////////////////////////////////////////////////////////////////////////////////

// function Comment(comment) {
//   this._comment = comment
//   this.getComment = function() {
//     return this._comment
//   }
// }

// function Post(title, content) {
//   this._title = title
//   this._content = content
//   this._comments = []
//   this.getTitle = function() {
//     return this._title
//   }
//   this.getContent = function(){
//     return this._content
//   }
//   this.comment = function(comment) {
//     this._comments.push(new Comment(comment))
//   }
//   this.getComments = function() {
//     return this._comments
//   }
// }

// function Author(name) {
//   this._name = name
//   this._posts = []
//   this.getName = function() {
//     return this._name
//   }
//   this.post = function(title, content) {
//     this._posts.push(new Post(title, content))
//   }
//   this.getPosts = function() {
//     return this._posts
//   }
// }

function PostNotFoundError(message) {
  this.message = message
  Error.captureStackTrace(this, this.constructor)

}
PostNotFoundError.prototype = Object.create(Error.prototype)
PostNotFoundError.prototype.constructor = PostNotFoundError

function Comment(content) {
  this.content = content
}

function Author(email) {
  this.email = email
  this.posts = []
}

Author.prototype.createPost = function(post) {
  post.setAuthor(this)
  this.posts.push(post)
}

Author.prototype.getPosts = function() {
  return this.posts
}

Author.prototype.findPostByTitle = function(title) {
  var found = this.posts.find(function(post) {
    return post.title === title
  })

  if (!found) {
    throw new PostNotFoundError('Post Not Found')
  }

  return found
}

function Post(attrs) {
  this.title = attrs.title
  this.content = attrs.content
  this.author = attrs.author
  this.comments = []
  this.maxLog = 10
}

Post.prototype.setAuthor = function(author) {
  this.author = author
}

Post.prototype.addComment = function(comment) {
  if (this.comments.length === this.maxLog) {
    throw new PostLimitError('Post Limit Reached')
    return
  }
  this.comments.push(comment)
}

Post.prototype.getComments = function() {
  return this.comments
}

var p1 = new Post({
  title: '',
  content: ''
})
var p2 = new Post({
  title: '',
  content: ''
})

var author = new Author('cc@gm.com')
author.createPost(p1)
author.createPost(p2)

var com1 = new com('')
var com2 = new com('')

p1.addComment(com1)
p1.addComment(com2)

var com3 = new com('')
var com4 = new com('')

p2.addComment(com3)
p2.addComment(com4)

try{
  author.findPostByTitle('The Lord of')
} carch (error) {
  if (error instanceof PostNotFoundError) {
    console.log('MESSAGE: ', error.message)
    console.log('STACK: ', error.stack)
  } else {
    throw error
  }
}

function PostLimitError(message) {
  this.message = message
  Error.captureStackTrace(this, this.constructor)
}
PostLimitError.prototype = Object.create(Error.prototype)
PostLimitError.prototype.constructor = PostLimitError