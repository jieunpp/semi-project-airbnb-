
function reservation(){
    if(document.form.startDate.value === ""){
        alert("체크인 날짜를 선택 해주세요");
        form.startDate.focus();
        return;
    }
    else if(document.form.endDate.value === ""){
        alert("체크아웃 날짜를 선택 해주세요");
        form.endDate.focus();
        return;
    }
    document.form.submit();
}
