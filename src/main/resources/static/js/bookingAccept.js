// 예약승인
function booking_accept(b_no){
    let ok = confirm("승인하시겠습니까?");
    if(ok === true){
        $.ajax({
            type:"POST",
            url:"/host/updateBookingState",
            data:{b_no: b_no, b_state: 1},
            success: function (isSuccess) {
                // console.log(isSuccess);
                $('#b_state_'+b_no).text('승인');
            },
            error: function (e){
                alert("업데이트 하지 못했습니다. 잠시 후 다시 시도해주세요.");
                console.log("updateBookingState error: "+e);
            }
        });
    }
}
// 예약거절
function booking_cancel(b_no){
    let ok = confirm("거부하시겠습니까?\n 고객님과 충분한 상의 후 선택해 주십시오");
    if(ok === true){
        $.ajax({
            type:"POST",
            url:"/host/updateBookingState",
            data:{b_no: b_no, b_state: 2},
            success: function (isSuccess) {
                // console.log(isSuccess);
                $('#b_state_'+b_no).text('거부');
            },
            error: function (e){
                alert("업데이트 하지 못했습니다. 잠시 후 다시 시도해주세요.");
                console.log("updateBookingState error: "+e);
            }
        });
    }
}