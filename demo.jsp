<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Watch Luxury - Thế giới đồng hồ cao cấp</title>
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@700&family=Roboto:wght@300;400;500&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #1a2a3a;
            --accent: #d4af37; /* Màu Gold */
            --text: #333;
            --light-bg: #f8f9fa;
            --white: #ffffff;
        }

        body {
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
            background-color: var(--light-bg);
            color: var(--text);
        }

        /* Top Menu - CSS theo yêu cầu */
        .top-menu {
            background: var(--primary);
            padding: 0;
            position: sticky;
            top: 0;
            z-index: 1000;
            box-shadow: 0 2px 10px rgba(0,0,0,0.2);
        }
        .top-menu ul {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
        }
        .top-menu a {
            color: rgba(255,255,255,0.8);
            text-decoration: none;
            padding: 20px 25px;
            display: inline-block;
            font-size: 14px;
            font-weight: 500;
            letter-spacing: 1px;
            text-transform: uppercase;
            transition: all 0.3s ease;
            position: relative;
        }
        .top-menu a::after {
            content: '';
            position: absolute;
            bottom: 15px;
            left: 50%;
            width: 0;
            height: 2px;
            background: var(--accent);
            transition: all 0.3s ease;
            transform: translateX(-50%);
        }
        .top-menu a:hover {
            color: var(--accent);
        }
        .top-menu a:hover::after {
            width: 30px;
        }

        /* Banner */
        .banner {
            height: 400px;
            background: linear-gradient(rgba(0,0,0,0.5), rgba(0,0,0,0.5)), 
                        url('https://images.unsplash.com/photo-1547996160-81dfa63595aa?q=80&w=2000') center/cover;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            text-align: center;
        }
        .banner-content h1 {
            font-family: 'Playfair Display', serif;
            font-size: 3.5rem;
            margin-bottom: 10px;
            letter-spacing: 2px;
        }
        .banner-content p {
            font-size: 1.2rem;
            font-weight: 300;
            opacity: 0.9;
        }

        /* Main Container */
        .main-container {
            max-width: 1200px;
            margin: 40px auto;
            display: grid;
            grid-template-columns: 260px 1fr;
            gap: 30px;
            padding: 0 20px;
        }

        /* Left Menu - Title CSS theo yêu cầu */
        .left-menu {
            background: var(--white);
            border-radius: 12px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0,0,0,0.05);
            height: fit-content;
        }
        .left-menu h3 {
            background: var(--primary);
            color: var(--accent);
            padding: 20px;
            margin: 0;
            font-size: 18px;
            text-align: center;
            letter-spacing: 1px;
            text-transform: uppercase;
            border-bottom: 2px solid var(--accent);
        }
        .left-menu ul {
            list-style: none;
            padding: 10px 0;
            margin: 0;
        }
        .left-menu li a {
            display: block;
            padding: 12px 25px;
            color: var(--text);
            text-decoration: none;
            font-size: 15px;
            transition: all 0.3s ease;
            border-left: 3px solid transparent;
        }
        .left-menu li a:hover {
            background: var(--light-bg);
            color: var(--primary);
            border-left: 3px solid var(--accent);
            padding-left: 30px;
        }

        /* Content Area */
        .title-section {
            font-family: 'Playfair Display', serif;
            font-size: 24px;
            color: var(--primary);
            margin-bottom: 25px;
            padding-bottom: 10px;
            border-bottom: 2px solid #eee;
            position: relative;
        }
        .title-section::after {
            content: '';
            position: absolute;
            bottom: -2px;
            left: 0;
            width: 60px;
            height: 2px;
            background: var(--accent);
        }

        /* Product Card - CSS theo yêu cầu */
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 25px;
            margin-bottom: 50px;
        }
        .product-card {
            background: var(--white);
            border-radius: 12px;
            padding: 15px;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            border: 1px solid #f0f0f0;
            position: relative;
            overflow: hidden;
        }
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.1);
            border-color: var(--accent);
        }
        .product-card img {
            width: 100%;
            height: 220px;
            object-fit: contain;
            margin-bottom: 15px;
            transition: transform 0.5s ease;
        }
        .product-card:hover img {
            transform: scale(1.1);
        }
        .product-card h4 {
            font-size: 16px;
            margin: 10px 0;
            color: var(--primary);
            font-weight: 500;
        }
        .product-card .price {
            color: #c0392b;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
        }
        .btn-detail {
            display: inline-block;
            background: var(--primary);
            color: white;
            padding: 8px 20px;
            text-decoration: none;
            border-radius: 25px;
            font-size: 13px;
            transition: all 0.3s ease;
            border: 1px solid var(--primary);
        }
        .btn-detail:hover {
            background: transparent;
            color: var(--primary);
        }

        /* Footer */
        footer {
            background: var(--primary);
            color: #999;
            text-align: center;
            padding: 40px 20px;
            margin-top: 60px;
            border-top: 4px solid var(--accent);
        }
        footer p {
            margin: 5px 0;
            font-size: 14px;
        }
        footer .team-info {
            color: var(--white);
            font-weight: 400;
            margin-bottom: 10px;
        }
        .card{background:white;padding:15px;border-radius:12px;transition:.3s}
.card:hover{transform:translateY(-5px);box-shadow:0 10px 20px rgba(0,0,0,.2)}
.card button{margin-top:10px;background:#0f5c3a;color:white;border:none;padding:8px;border-radius:6px;cursor:pointer}
.card button:active{transform:scale(0.9)}

#cartBox {
    position: absolute; 
    top: 80px;  
    right: 20px; 
    width: 300px;
    display:none;
    height: auto; 
    border-radius: 10px; 
    background: white;
    padding: 20px;
    z-index: 900;
}
#cartItems p{display:flex;justify-content:space-between}
.form-box{
position:fixed;
top:50%;
left:50%;
transform:translate(-50%,-50%);
background:white;
color:black;
padding:30px;
border-radius:16px;
display:none;
width:420px;
z-index:1000;

/* nổi bật */
border:2px solid #1a2a3a;
box-shadow:0 20px 50px rgba(0,0,0,0.6);
backdrop-filter: blur(10px);

/* animation */
animation:fadeIn .25s ease;
}

@keyframes fadeIn{
from{opacity:0;transform:translate(-50%,-60%)}
to{opacity:1;transform:translate(-50%,-50%)}
}

/* overlay nền tối phía sau */
.overlay-bg{
position:fixed;
top:0;left:0;width:100%;height:100%;
background:rgba(0,0,0,0.65);
display:block;
z-index:999;
}
.form-box input,.form-box textarea{
width:395px;
padding:12px;
margin:8px 0;
border-radius:10px;
border:1px solid #ccc;
}
.form-box textarea{
    overflow-wrap: break-word;
    word-break: break-word;
    word-wrap: break-word;
    white-space: pre-wrap;
}
.form-box input:focus,.form-box textarea:focus{
border:1px solid #1a2a3a;
box-shadow:0 0 8px rgba(15,92,58,0.3);
outline:none;
}
.form-box button{width:100%;padding:12px;background:#1a2a3a;color:white;border:none;border-radius:10px}
.close-arrow{cursor:pointer}
.switch{text-align:center;margin-top:10px;cursor:pointer;color:#1a2a3a}

.search-overlay{
position:fixed;top:0;left:0;width:100%;height:100%;
display:none;flex-direction:column;z-index:999;
}

.search-top-area{
height:40%;background:#0f5c3a;
display:flex;align-items:center;justify-content:center;
position:relative;
}

.search-bottom-area{
height:60%;background:rgba(255,255,255,0.6);
backdrop-filter: blur(10px);
}

.search-close{
position:absolute;left:30px;top:20px;
cursor:pointer;font-size:22px;
}

.search-form{width:60%;max-width:700px}

.search-wrapper{
display:flex;
background:rgba(255,255,255,0.2);
padding:16px 20px;
border-radius:40px;
backdrop-filter: blur(8px);
}

.search-wrapper input{
flex:1;background:none;border:none;color:white;
outline:none;font-size:16px
}

.search-wrapper button{
background:none;border:none;color:white;font-size:18px;cursor:pointer
}

.search-result{
position:absolute;
top:65%;
width:60%;
max-width:700px;
background:white;color:black;
border-radius:12px;
display:none;
max-height:250px;
overflow:auto;
box-shadow:0 10px 30px rgba(0,0,0,0.3);
}

.search-item{padding:12px;border-bottom:1px solid #eee;cursor:pointer}
.search-item:hover{background:#eee}

.badge{background:red;border-radius:50%;padding:2px 6px;font-size:12px}
nav a, nav a *{
  cursor: pointer !important;
}
    </style>
</head>
<body>
    <header>
        <div class="banner">
            <div class="banner-content">
                <h1>LUXURY TIMEPIECE</h1>
                <p>Khẳng định đẳng cấp qua từng giây phút</p>
            </div>
        </div>
        <nav class="top-menu">
            <ul>
                <li><a onclick="goHome()">Trang Chủ</a></li>
                <li><a href="products">Sản Phẩm</a></li>
                <li><a onclick="openContact()">Liên Hệ</a></li>
                <li><a onclick="openCart()">Giỏ Hàng</a></li>
                <li><a onclick="openLogin()">Đăng Nhập</a></li>
            </ul>
        </nav>
    </header>

    <div class="main-container">
        <aside class="left-menu">
            <h3>DANH MỤC</h3>
            <ul>
                <li><a href="?cat=moi">Bộ Sưu Tập Mới</a></li>
                <li><a href="?cat=chay">Sản Phẩm Bán Chạy</a></li>
                <li><a href="?cat=giamgia">Ưu Đãi Đặc Biệt</a></li>
                <li><a href="?cat=nam">Đồng Hồ Nam</a></li>
                <li><a href="?cat=nu">Đồng Hồ Nữ</a></li>
                <li><a href="?cat=phukien">Phụ Kiện</a></li>
            </ul>
        </aside>

        <section class="content">
            <h2 class="title-section">HÀNG MỚI VỀ</h2>
            <div class="product-grid">
                <c:forEach items="${listNew}" var="p">
                    <div class="product-card">
                        <img src="${p.image}" alt="${p.name}">
                        <h4>${p.name}</h4>
                        <fmt:setLocale value="vi_VN"/>
                        <p class="price">
                            <fmt:formatNumber value="${p.price}" type="number"/> VNĐ
                        </p>
                        <a href="detail?id=${p.id}" class="btn-detail">Xem Chi Tiết</a>
                    </div>
                </c:forEach>
                
            </div>
            
            <h2 class="title-section">BÁN CHẠY NHẤT</h2>
            <div class="product-grid">
                <c:forEach items="${listHot}" var="p">
                    <div class="product-card">
                        <img src="${p.imageUrl}" alt="${p.name}">
                        <h4>${p.name}</h4>
                        <p class="price">${p.price} VNĐ</p>
                        <a href="detail?id=${p.id}" class="btn-detail">Xem Chi Tiết</a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
    <div class="form-box" id="loginBox">
<div class="close-arrow" onclick="closeLogin()">←</div>
<h2 id="formTitle">Đăng nhập</h2>
<div id="loginFields">
<input id="user" placeholder="Tên đăng nhập">
<input id="pass" type="password" placeholder="Mật khẩu">
</div>
<div id="registerFields" style="display:none">
<input placeholder="Họ tên">
<input placeholder="Email">
<input placeholder="SĐT">
<input placeholder="Địa chỉ">
<input type="password" placeholder="Mật khẩu">
<input type="password" placeholder="Nhập lại mật khẩu">
</div>
<button onclick="login()">Xác nhận</button>
<div class="switch" onclick="toggleForm()">Chưa có tài khoản? Đăng ký</div>
</div>
    
<div id="cartBox">
        <div class="close-arrow" onclick="closeCart()">←</div>
        <h2>Giỏ hàng</h2>
        <div id="cartItems"></div>
        <h3 id="totalPrice">Tổng: 0</h3>
        <button onclick="checkout()" style="margin-top:10px;width:100%;padding:12px;background:#1a2a3a;color:white;border:none;border-radius:10px">Thanh toán</button>
        </div>
<!-- CONTACT -->
        <div class="form-box" id="contactBox">
        <div class="close-arrow" onclick="closeContact()">←</div>
        <h2>Liên hệ</h2>
        <input id="cname" placeholder="Tên">
        <input id="cemail" placeholder="Email">
        <textarea style="resize: none" id="cmsg" rows="5" placeholder="Nội dung"></textarea>
        <button onclick="sendContact()">Gửi</button>
        <p id="cStatus"></p>
        </div>
    <script>
        function openLogin(){
            loginBox.style.display='block';
            addOverlay(closeLogin);
            closeCart();
            }
            function closeLogin(){
            loginBox.style.display='none';
            removeOverlay();
            }
            let isLogin=true;
            function toggleForm(){
            isLogin=!isLogin;
            formTitle.innerText=isLogin?"Đăng nhập":"Đăng ký";
            loginFields.style.display=isLogin?'block':'none';
            registerFields.style.display=isLogin?'none':'block';
            document.querySelector(".switch").innerText = 
                isLogin ? "Chưa có tài khoản? Đăng ký" : "Đã có tài khoản? Đăng nhập";

            }
            
function openContact(){
contactBox.style.display='block';
addOverlay(closeContact);
closeCart();
}

function closeContact(){
contactBox.style.display='none';
removeOverlay();
}

function sendContact(){cStatus.innerText='Đã gửi'}
let cart=[];
function addToCart(n,p){cart.push({n,p});updateCart();}
function updateCart(){
let html='',t=0;
cart.forEach((i,idx)=>{
 t+=i.p;
 html+=`<p>${i.n} ${i.p.toLocaleString()} VND <button onclick="removeItem(${idx})">X</button></p>`;
});
document.getElementById("cartItems").innerHTML=html || "Chưa có sản phẩm";
document.getElementById("totalPrice").innerText="Tổng: "+t.toLocaleString()+" VND";
document.getElementById("cartCount").innerText=cart.length;
}
function removeItem(i){cart.splice(i,1);updateCart();}

function checkout(){
if(cart.length===0){alert('Giỏ hàng trống');return;}
alert('Thanh toán thành công (demo)');
cart=[];
updateCart();
closeCart();
}

function openCart(){cartBox.style.display='block'}
function closeCart(){cartBox.style.display='none'}
function addOverlay(onClose){
  removeOverlay();
  const o=document.createElement('div');
  o.className='overlay-bg';
  o.id='overlay';
  o.onclick=onClose; // click ra ngoài để đóng
  document.body.appendChild(o);
}
function removeOverlay(){
  const o=document.getElementById('overlay');
  if(o) o.remove();
}
    </script>
    <footer>
        <p class="team-info">Phát triển bởi: <strong>Hà Đức Anh & Đinh Ngọc Dũng & Nguyễn Trung Kiên</strong></p>
        <p>Hệ thống phân phối đồng hồ chính hãng hàng đầu Việt Nam</p>
        <p>&copy; 2026 Luxury Watch Store. All Rights Reserved.</p>
    </footer>
</body>
</html>