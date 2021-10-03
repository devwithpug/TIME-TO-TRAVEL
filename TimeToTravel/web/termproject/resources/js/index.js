/*
    자바 스크립트 예시 코드를 참고하여 작성했습니다.
 */

$(document).ready(function() {
    // 메인 이미지 랜덤
    let rand = Math.floor(Math.random() * 4) + 1;
    $('#main-img').css({'background-image': 'url(/termproject/resources/img/home_img' + rand + '.png)'});

    // 텍스트 타이핑
    var $typing = $(".main-img-text");
    var text = "TIME TO TRAVEL,\n여행 갈 시간!";
    $typing.html("");

    var chars = text.split("");

    chars.forEach(function (item) {
        item = (item == " ") ? "&nbsp" : ((item == "\n") ? "<br>" : item);
        $("<span></span>").html(item).appendTo($typing);
    });
    var $caret = $("<span></span>").attr("id", "caret").css({
        width: "10px", height: "20px",
    }).appendTo($typing);

    var typing_speed = 200;
    var start_delay = 2000;

    $typing.children(":not(#caret)").hide().each(function (index) {
        var delay = start_delay + typing_speed * index;

        $(this).delay(delay).show(10);
    });
});




var slideIndex = 0;
            
function showSlides() {
    var i;
    var slides = document.getElementsByClassName("mySlides");
    var dots = document.getElementsByClassName("dot");
    for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
    }
    slideIndex++;
    if (slideIndex > slides.length) {slideIndex = 1}    
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    
    dots[slideIndex-1].className += " active";
    setTimeout(showSlides, 2000);
}
$(document).ready(function() {
    var slides2 = document.querySelector('.slides'),
        slide = document.querySelectorAll('.slides li'),
        currentIdx = 0,
        slideCount = slide.length,
        prevBtn = document.querySelector('.prev'),
        slideWidth = 200,
        slideMargin = 20,
        nextBtn = document.querySelector('.next');

    slides2.style.width = (slideWidth + slideMargin)*slideCount - slideMargin + 20 + 'px';

    function moveSlide(num){
        slides2.style.left = -num * 220 + 'px';
        currentIdx = num;
    }
    nextBtn.addEventListener('click', function(){
        if(currentIdx < slideCount - 5){
            moveSlide(currentIdx + 1);
            console.log(currentIdx);
        }else{
            moveSlide(0);
        }
    });
    prevBtn.addEventListener('click', function(){
        if(currentIdx > 0){
            moveSlide(currentIdx - 1);
            console.log(currentIdx);
        }else{
            moveSlide(0);
        }
    });
});
