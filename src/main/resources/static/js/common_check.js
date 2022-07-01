
// 내정보 수정의 pw일치 확인
$(function(){
    $('#pw').keyup(function(){
        $('#alert_a').html('');
    });

    $('#pw2').keyup(function(){
        if($('#pw').val() !== $('#pw2').val()){
            $('#alert_a').html('비밀번호 일치하지 않음<br><br>');
            $('#alert_a').css("color", "red");
            $('#submitBtn').attr("disabled", true);
        } else{
            $('#alert_a').html('비밀번호 일치함<br><br>');
            $('#alert_a').css("color", "#0100C6");
            $('#submitBtn').attr("disabled", false);
        }

    });
});

// 비밀번호 수정 input창 열기닫기
function hostPw () {

    let btnText = $('#pwChangBtn').text()

    if (btnText === '비밀번호 변경하기') {
        $('#pw').attr("disabled", false);
        $('#pw2').attr("disabled", false);
        $('#pwChangBtn').text('비밀번호 변경취소')
    }
    else {
        $('#pw').val('').attr("disabled", true);
        $('#pw2').val('').attr("disabled", true);
        $('#pwChangBtn').text('비밀번호 변경하기')
        $('#submitBtn').attr("disabled", false);
        $('#alert_a').text('')
    }
}
