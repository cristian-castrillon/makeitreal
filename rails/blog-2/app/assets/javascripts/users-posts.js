function UsersPosts() {
  
  $('.create-new-post').on('ajax:success', function (event, xhr) {
    var content = xhr.responseText
    $('.new-form').append(content)
  })
}