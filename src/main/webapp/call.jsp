<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="./css/style.css">
    <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
    <link rel="stylesheet" href="./font/fontawesome-free-5.15.3-web/css/all.css">
    <title>Call</title>
</head>
<body>
    <div class="person">
        <img class="img_person" src="./img/person.png" alt="">
    </div>
    <div class="clock">
        <div class="hour time js_hour">00 :</div>
        <div class="minute time js_minute">00 :</div>
        <div class="second time js_second">00</div>
    </div>
    <div class="call">
            <img src="./img/mic.png" alt="" class="img_mic img_item">

            <img src="./img/addperson.jpg" alt="" class="img_addperson img_item">

            <img src="./img/outcall.jpg" alt="" class="img_outcall img_item">
        </div>
</body>
<script>
    function count_time(){
        var hour= console.log(document.getElementsByClassName("js_hour").innerHTML);
        var minute= console.log(document.getElementsByClassName("js_minute").innerHTML);
        var second= console.log(document.getElementsByClassName("js_second").innerHTML);
        second+=1;
        if(second==60){
            minute+=1;
            second=0;
        }
        if(minute=60){
            hour+=1;
            minute=0;
        }
    if(hour<10){
        hour="0"+hour;
    }
    if(minute<10){
        minute="0"+minute;
    }
    if(second<10){
        second="0"+second;
    }
    document.getElementById("clock").innerHTML = hour+" :"+minute+" : "+second;
    }

</script>
</html>
    