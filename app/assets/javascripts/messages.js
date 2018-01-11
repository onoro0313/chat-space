$(function(){
  function buildHtml(message){
      // console.log(message);

    var html = `  <ul class='chat-messages'>
                      <li class='chat-message'>
                        <div class='chat-message__header'>
                          <p class='chat-message__user'>
                            ${ message.user_name}
                          </p>
                          <p class='chat-message__date'>
                            ${ message.created_at}
                          </p>
                          <p class='chat-message__text'>
                            ${ message.body }
                          </p>
                        </div>
                      </li>
                  </ul>
`
    if (message.image.url){
      html += `<p class="chat-message__text">

                <img src="${message.image.thumb.url}">
              </p>`
    }
    return html;
  }
  $('#new_message').on('submit', function(e){
    e.preventDefault();
    var formData = new FormData($(this)[0])
    var url = $(this).attr('action')
    // console.log("0 ban");
    // console.log($(this)[0]);
    // console.log("normal");
    // console.log($(this));
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false,
    })
    .done(function(data){
      var html = buildHtml(data);
      $('.chat-body').append(html);
      $('.chat-footer__input').val('');
      $('.chat-body').animate({scrollTop: $(".chat-body")[0].scrollHeight}, "slow");
      $('#new_message')[0].reset();
    })

    .fail(function(){
      alert('error');
    });

    return false;}
    // return false入れたら、jqueryが最初の一回以外にも起動するようになった、この理由が知りたい。
  });
});
