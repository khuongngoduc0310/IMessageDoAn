<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/style.css">
        <link rel="stylesheet" href="./css/base.css">
        <link rel="stylesheet" href="./font/fontawesome-free-5.15.3-web/css/all.css">
        <link rel="stylesheet" href="./font/themify-icons/themify-icons.css">
        <title>Document</title>
    </head>
    <body>
        <div class="IMessApp">
            .
        </div>
        <div class="formLogin">
            <div class="grid">
                <header class="formLogin__header">
                    <div class="formLogin__header-navbar">
                        <div class="formLogin__header-img">
                            <img class="formLogin__header-img-logo" src="./img/logoMessenger.png" alt="logo logoMessenger">
                        </div>
                        <ul class="formLogin__navbar-list">
                            <li class="formLogin__navbar-item">
                                <a href="" class="formLogin__item-link">
                                    Phòng họp mặt
                                </a>
                            </li>
                            <li class="formLogin__navbar-item">
                                <a href="" class="formLogin__item-link">
                                    Tính năng
                                </a>
                            </li>
                            <li class="formLogin__navbar-item">
                                <a href="" class="formLogin__item-link">
                                    ứng dụng dành cho máy tính
                                </a>
                            </li>
                            <li class="formLogin__navbar-item">
                                <a href="" class="formLogin__item-link">
                                    Quyền riêng tư và an toàn
                                </a>
                            </li>
                            <li class="formLogin__navbar-item">
                                <a href="" class="formLogin__item-link">
                                    Dành cho nhà phát triển
                                </a>
                            </li>
                        </ul>
                    </div>
                </header>
                <div class="formLogin__body">
                    <div class="formLogin__body-content">
                        <h1 class="formLogin__content-sologan">
                            Tụ họp <br> mọi lúc, mọi nơi
                        </h1>
                        <span class="formLogin__content-description">
                            Với Messenger, việc kết nối với những người mình yêu mến thật đơn giản và thú vị.
                        </span>
                        <div class="formLogin__content-form">
                            <form class="formLogin__form-group" action="C_checklogin" method="post">
                                <input class="formLogin__group-input" type="text" placeholder="Email hoặc số điện thoại" name="username">
                                <input class="formLogin__group-input" type="password" placeholder="Password" name="password">
                                <div class="formLogin__group-btn">
                                    <button class="formLogin__group-btnLogin">Đăng nhập</button>
                                    <a class="formLogin__group-btnResetPassword" href="">Quên mật khẩu?</a>
                                    <a class="formLogin__group-register js-register-open" href="#">Đăng ký nếu chưa có tài khoản</a>
                                </div>
                                </form>
                                <div class="formLogin__group-savePW">
                                    <!--nếu duy trì đăng nhập add class này: formLogin__savePW-radio--checked -->
                                    <div class="formLogin__savePW-radio formLogin__savePW-radio--checked">
                                        <i class="formLogin__savePW-radio-icon fas fa-check-square"></i>
                                    </div>
                                    <label class="formLogin__savePW-label" for="">Duy trì đăng nhập</label>
                                </div>
                                <div class="formLogin__form-download">
                                    <a href="" class="formLogin__form-download-appstore">
                                        <img src="./img/download/appStore.svg" alt="" class="formLogin_form-download-img">
                                    </a>
                                    <a href="" class="formLogin__form-download-Microsoft">
                                        <img src="./img/download/Microsoft.png" alt="" class="formLogin_form-download-img">
                                    </a>
                                </div>

                        </div>
                    </div>
                    <div class="formLogin__body-image">
                        <img class="formLogin__body-image-main" src="./img/fb-messenger.jpg" alt="">
                    </div>
                </div>
                <footer class="formLogin__footer">
        
                </footer>
            </div>
        </div>
        <!-- REGISTER -->
        <div class="register js-register">
          <div class="register-container ">
           <header class="register-header">
               Đăng kí
           </header>
           <div class="register-close js-register-close">
               <i class="register-close-icon ti-close js-register-close"></i>
          </div>
           <div class="register-body">
               <div class="register-row">
               <label for="" class="register-label">
                   Họ và tên
               </label>
               <input type="text" placeholder="Họ và tên" class="register-input">
           </div>
           <div class="register-row">
               <label for="" class="register-label">
                   Tuổi
               </label>
               <input type="text" placeholder="Tuổi" class="register-input">
           </div>
            <div class="register-row">
            <label for="" class="register-label">
                Giới tính
            </label>
            <input type="text" placeholder="Giới tính" class="register-input">
            </div>
            <div class="register-row">
               <label for="" class="register-label">
                   Mật khẩu
               </label>
               <input type="text" placeholder="Mật khẩu" class="register-input">
           </div>
           <div class="register-row">
               <label for="" class="register-label">
                   Nhập lại mật khẩu
               </label>
               <input type="text" placeholder="Nhập lại mật khẩu" class="register-input">
           </div>
            </div>
           <button id="register-btn">
            Đăng kí
           </button>
    
           </div>
        </div>
        <!-- Đăng kí -->
        <script>
            const regsopen = document.querySelector('.js-register-open')
            const regsclose = document.querySelector('.js-register-close')
            const register = document.querySelector('.js-register')
            function Showregister(){
                register.classList.add('open')
            }
            function Hideregister(){
                register.classList.remove('open')
            }
            regsopen.addEventListener('click',Showregister)
            regsclose.addEventListener('click',Hideregister)
        </script>
    
    
        <!-- Duy trì đăng nhập -->
        <script>
            const continueLogin = document.querySelector('.formLogin__savePW-radio');
    
            function check(){
                continueLogin.classList.add('formLogin__savePW-radio--checked');
            }
            continueLogin.addEventListener('click', check);
        </script>
    </body>
    </html>