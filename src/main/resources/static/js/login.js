// 로그인 공백체크
function blackCheck(){
    let black = false;

    let id = $("userID").val();
    let pw = $("userPW").val();

    if(id === ""){
        alert("아이디를 입력해 주세요!");
    }
    else if (pw === ""){
        alert("비밀번호를 입력해 주세요!");
    }
    else {
        black = true;
    }
    return black;
}

// 회원구분 팝업
function join_popup(){
    window.open("join_check","check" ,"width=700, height=350, left=700, top=300");
}

function user(){
    opener.document.location.href = "/u_lgn001";
    self.close();
}

function host(){
    opener.document.location.href = "/h_lgn001";
    self.close();
}

// 회원가입 유효성검사

function loginSubmit() {
    let isFillOut = false;
    console.log('here');

    let name = $("#name").val();
    let nick = $("#nick").val()
    let email = $("#emailID").val();
    let pw = $("#pw").val();
    let pwCheck = $("#pwCheck").val();
    let middle_phone = $("#phone1").val();
    let last_phone = $("#phone2").val();


    if (name === "") {
        alert("이름을 입력해주세요.");
        $("#name").focus();
    }
    else if (nick === "") {
        alert("닉네임을 입력해주세요!");
        $("#nick").focus();
    } else if (email === "") {
        alert("이메일을 입력해주세요");
        $("#emailID").focus();
    } else if (pw === "") {
        alert("비밀번호를 입력해주세요!");
        $("#pw").focus();
    } else if (pwCheck === "") {
        alert("비밀번호를 다시 확인해주세요");
        $("#pwCheck").focus();
    } else if (pw !== pwCheck) {
        alert("비밀번호가 같지 않습니다.");
        $("#userPW").focus();
    } else if (middle_phone === "") {
        alert("전화번호를 입력해주세요");
        $("#phone1").focus();
    } else if (last_phone === "") {
        alert("전화번호를 입력해주세요");
        $("#phone2").focus();
    } else {
        isFillOut = true;
    }
    return isFillOut;
}

$(function(){
    $( '#emailID').on("blur keyup", function() {
        $(this).val( $(this).val().replace( /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣 | ~!@\#$%<>^&*\()=+_\’]/g, '' ) );
    });
});

$(function(){
    $( '#nick').on("blur keyup", function() {
        $(this).val( $(this).val().replace( /[^0-9|ㄱ-ㅎ|가-힣]/g, '' ) );
    });
});

// $(function(){
//     $("#name").keyup(function (event) {
//         regexp = /[a-z0-9]|[ \[\]{}()<>?|`~!@#$%^&*-_+=,.;:\"'\\]/g;
//         v = $(this).val();
//         if (regexp.test(v)) {
//             alert("한글만 입력가능 합니다.");
//             $(this).val(v.replace(regexp, ''));
//         }
//     });
// });


// 아이디 중복체크
$(function(){
    $('#emailID').change(function(){
        let u_mail = document.getElementById('emailID').value + $('#emailAddr option:selected').val();
        console.log(u_mail);
        $.ajax({
            type:"POST",
            url:"/register/checkSignup",
            data:{u_mail : u_mail},
            success:function(data){	//data : checkSignup에서 넘겨준 결과값
                console.log($.trim(data));
                // alert(data.trim());
                if(data === "YES"){
                    if($('#emailAddr option:selected').val() ==='선택'){
                        $("#mail_check").text("사용 불가능한 아이디입니다.");
                        $("#mail_check").css("color", "red");
                    }else{
                        $("#mail_check").text("사용 가능한 아이디입니다.");
                        $("#mail_check").css("color", "blue");
                    }
                }else{
                    if($('#emailID').val()+$('#emailAddr option:selected').val() !==''){
                        $("#mail_check").text("사용중인 아이디입니다.");
                        $("#mail_check").css("color", "red");
                        $('#emailText').focus();
                    }
                }
            }

        });
    });
});

$(function(){
    $('#emailAddr').blur(function(){
        var u_mail = document.getElementById('emailID').value + $('#emailAddr option:selected').val();
        console.log(u_mail);
        $.ajax({
            type:"POST",
            url:"/register/checkSignup",
            data:{ u_mail : u_mail},
            success:function(data){	//data : checkSignup에서 넘겨준 결과값
                if(data === "YES"){
                    if($('#emailID').val() + $('#emailAddr option:selected').val() !==''){
                        $("#mail_check").text("사용 가능한 아이디입니다.");
                        $("#mail_check").css("color", "blue");
                    }
                }else{
                    if($('#emailID').val()+$('#emailAddr option:selected').val() !==''){
                        $("#mail_check").text("사용중인 아이디입니다.");
                        $("#mail_check").css("color", "red");
                        $('#emailText').focus();

                    }
                }
            }

        });
    });
});

//닉네임 중복체크
$(function(){
    $('#nick').change(function(){
        var u_nick = $("#nick").val();
        console.log(u_nick);
        $.ajax({
            type: "POST",
            url:"/register/nickCheck.do",
            data:{u_nick :u_nick},
            success:function(data){
                console.log(data);
                if($.trim(data)==="Y"){
                    $('#msg').text("사용가능한 닉네임입니다.");
                    $('#msg').css("color","blue");

                }else if($.trim(data)==="N"){//닉네임값 DB에 존재할때,
                    $('#msg').text("사용불가능한 닉네임입니다.");
                    $('#msg').css("color","red");
                    $('#nick').focus();
                }
            },
            error:function (e){
                console.log(e);
                alert("에러발생");
            }
        });
    });
});
