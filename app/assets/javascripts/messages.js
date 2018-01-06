$(function(){
  console.log("herr");
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    console.log(this)
    var formData = new FormData($(this))
  })
})
