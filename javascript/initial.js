function User(name, lastname) {
  console.log('name = ', name, 'lastname = ', lastname)
}

function sayYes (name) {
  return 'Yes ' + name
}

function sum(num1 = 0, num2 = 0) {
  return num1 + num2
}

function sum(num1, num2) {
  
  // if (num2 === null) {
  //   return num1
  // }
  // return num1 + num2
  if (num2 == null) {
    return num1
  }else if (num1 == null) {
    return 0
  } else {
    return num1 + num2
  }
}

function sum(num1, num2) {
  num1 = num1 || 0
  num2 = num2 || 0
  return num1 + num2
}

[1, 2, 3, 4, 5].forEach(function (value, index) {
  console.log('arr[', index, '] = ', value)
})

[1, 2, 3, 4, 5].map(function (value, index) {
  return value ** index
})

[1, 2, 3, 4, 5, 6].filter(function (value) {
  return value%2 === 0
})

function User (name, lastname) {
  this.var age = '31'
  var celular = '123456'
  this.fullname = function () {
    return name + ' ' + lastname
  }
}