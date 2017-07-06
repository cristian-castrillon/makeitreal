// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/
function PostView() {
  $('.new_post').on('submit', function (event) {
    
    var title = $('#post_title').val()
    var content = $('#post_content').val()
    var isValid = true
    if (!(title.length) || title.length > 100 ) {
      alert('blank title')
      isValid = false
    }

    if (!(content.length) || content.length > 140) {
      alert('blank message')
      isValid = false
    }

    if (!isValid) {
      event.preventDefault()
    }
    // alert('CATCH')
  })
}