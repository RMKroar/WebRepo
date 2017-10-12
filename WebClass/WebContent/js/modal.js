  /* access to dummy server, using JQuery */
  $(document).ready(function () {
    var id;
    $('#loginForm').submit(function (event) {
      // block features that automatically submitted by form - 'loginForm'
      event.preventDefault();

      // get ID, Password value from 'loginForm' - in classic Javascript : document.getElementById("id").value;
      var id = $('#id').val();
      var pw = $('#pw').val();

      // send to Server as POST (ajax : non-synchronous method)
      $.post("http://httpbin.org/post", { id: id, pw: pw }, function(data) {
        var myModal = $('#myModal');
        myModal.modal();
        myModal.find('.modal-body').text(data.form.id + "님 로그인되었습니다.");
      });
    });

    $('#regForm').submit(function (event) {
      console.log("submit");
      event.preventDefault();
      sign();
    });
  });

  $('#signinModal').on('show.bs.modal', function (event) {
      var button = $(event.relatedTarget);// Button that triggered the modal
      // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
      // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
      var modal = $(this);
      modal.find('.modal-title').text('회원가입');
      //modal.find('.modal-body input').val(recipient)
    });
function sign() {
  var myModal = $('#signinModal');
  myModal.modal('hide');
  var newModal = $('#successModal');
  newModal.modal();
  newModal.find('.modal-body').text($('#name').val()+"님, 환영합니다!")
}
