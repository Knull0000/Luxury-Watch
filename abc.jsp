<%-- 
    Document   : abc
    Created on : Mar 31, 2026, 9:34:49 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="vi">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Luxury Watch</title>

<style>
body{margin:0;font-family:Arial;background:#0a0a0a;color:white}

header{display:flex;justify-content:space-between;align-items:center;padding:14px 40px;background:#0f5c3a}
header h1{font-size:13px;letter-spacing:4px}
nav{display:flex;gap:20px;align-items:center}
nav a{color:white;text-decoration:none;cursor:pointer;font-size:14px;display:flex;align-items:center;gap:6px}

svg{fill:white}

.container{display:flex}
.left-menu{width:220px;background:#111;padding:20px}
.left-menu a{display:block;color:white;margin:12px 0;text-decoration:none;transition:.3s}
.left-menu a:hover{color:#0f5c3a;transform:translateX(5px)}

.content{flex:1;padding:30px;background:#f5f5f5;color:black}
.banner{height:180px;background:url('https://images.unsplash.com/photo-1524592094714-0f0654e20314') center/cover;border-radius:12px;margin-bottom:20px}

.products{display:grid;grid-template-columns:repeat(3,1fr);gap:20px}
.card{background:white;padding:15px;border-radius:12px;transition:.3s}
.card:hover{transform:translateY(-5px);box-shadow:0 10px 20px rgba(0,0,0,.2)}
.card button{margin-top:10px;background:#0f5c3a;color:white;border:none;padding:8px;border-radius:6px;cursor:pointer}
.card button:active{transform:scale(0.9)}

#cartBox{position:fixed;top:0;right:0;width:360px;height:100%;background:white;color:black;display:none;padding:20px;box-shadow:-10px 0 30px rgba(0,0,0,.3)}
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
border:2px solid rgba(15,92,58,0.7);
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
width:100%;
padding:12px;
margin:8px 0;
border-radius:10px;
border:1px solid #ccc;

/* focus đẹp hơn */
transition:0.2s;
}

.form-box input:focus,.form-box textarea:focus{
border:1px solid #0f5c3a;
box-shadow:0 0 8px rgba(15,92,58,0.3);
outline:none;
}
.form-box button{width:100%;padding:12px;background:#0f5c3a;color:white;border:none;border-radius:10px}
.close-arrow{cursor:pointer}
.switch{text-align:center;margin-top:10px;cursor:pointer;color:#0f5c3a}

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
</style>
</head>
<body>

<header>
<h1>ROLEX</h1>
<nav>
<a onclick="goHome()">Trang chủ</a>
<a onclick="openContact()">Liên hệ</a>
<a onclick="openCart()">
<svg width="18" viewBox="0 0 24 24"><path d="M7 18c-1.1 0-1.99.9-1.99 2S5.9 22 7 22s2-.9 2-2-.9-2-2-2zm10 0c-1.1 0-1.99.9-1.99 2S15.9 22 17 22s2-.9 2-2-.9-2-2-2zM7.16 14l.84-2h7.45c.75 0 1.41-.41 1.75-1.03l3.58-6.49A.996.996 0 0019.58 3H5.21l-.94-2H1v2h2l3.6 7.59-1.35 2.44C4.52 13.37 5.23 15 6.59 15H19v-2H7.16z"/></svg>
<span id="cartCount" class="badge">0</span>
</a>
<a onclick="openSearch()">
<svg width="18" viewBox="0 0 16 16"><path d="m14.8 13.4-4-4c.7-1 1.1-2.1 1.1-3.4 0-3.2-2.6-5.8-5.8-5.8-3.3 0-5.9 2.6-5.9 5.8s2.6 5.8 5.8 5.8c1.3 0 2.4-.4 3.4-1.1l4 4zm-8.8-3.5c-2.1 0-3.9-1.7-3.9-3.9 0-2.1 1.8-3.9 3.9-3.9s3.9 1.8 3.9 3.9c0 2.2-1.7 3.9-3.9 3.9z"/></svg>
</a>
<a onclick="openLogin()">
<svg width="18" viewBox="0 0 24 24"><path d="M12 12c2.7 0 5-2.3 5-5s-2.3-5-5-5-5 2.3-5 5 2.3 5 5 5zm0 2c-3.3 0-10 1.7-10 5v3h20v-3c0-3.3-6.7-5-10-5z"/></svg>
</a>
</nav>
</header>

<div class="container">
<div class="left-menu">
<a onclick="filterCategory('new')">Hàng mới</a>
<a onclick="filterCategory('hot')">Bán chạy</a>
<a onclick="filterCategory('sale')">Giảm giá</a>
</div>

<div class="content">
<div class="banner"></div>
<h2>Sản phẩm</h2>
<div class="products" id="productList"></div>
</div>
</div>

<div id="cartBox">
<div class="close-arrow" onclick="closeCart()">←</div>
<h2>Giỏ hàng</h2>
<div id="cartItems"></div>
<h3 id="totalPrice">Tổng: 0</h3>
<button onclick="checkout()" style="margin-top:10px;width:100%;padding:12px;background:#0f5c3a;color:white;border:none;border-radius:10px">Thanh toán</button>
</div>

<!-- LOGIN + REGISTER FULL -->
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

<!-- CONTACT -->
<div class="form-box" id="contactBox">
<div class="close-arrow" onclick="closeContact()">←</div>
<h2>Liên hệ</h2>
<input id="cname" placeholder="Tên">
<input id="cemail" placeholder="Email">
<textarea id="cmsg" rows="5" placeholder="Nội dung"></textarea>
<button onclick="sendContact()">Gửi</button>
<p id="cStatus"></p>
</div>

<!-- SEARCH -->
<div class="search-overlay" id="searchOverlay">

<div class="search-top-area">
<div class="search-close" onclick="closeSearch()">←</div>

<form class="search-form" onsubmit="return false;">
<div class="search-wrapper">
<input id="searchInput" placeholder="Tìm sản phẩm..." onkeyup="searchProduct(event)">
<button onclick="submitSearch()">🔍</button>
</div>

<div id="searchResult" class="search-result"></div>
</form>

</div>

<div class="search-bottom-area"></div>
</div>

<script>
let products=[];
for(let i=1;i<=30;i++){
products.push({name:'Rolex '+i,price:1000000*i,cat:i%3==0?'sale':i%2==0?'hot':'new'});
}

function render(list=products){
let html='';

if(list.length===0){
  html = `
  <div style="grid-column:1/-1;text-align:center;padding:40px;color:#666">
    <h3>Không tìm thấy sản phẩm</h3>
    <p>Hãy thử từ khóa khác</p>
  </div>`;
}else{
  list.forEach(p=>{
    html+=`<div class='card'>
    <h3>${p.name}</h3>
    <p>${p.price.toLocaleString()} VND</p>
    <button onclick="addToCart('${p.name}',${p.price})">Thêm</button>
    </div>`;
  });
}

document.getElementById("productList").innerHTML=html;
}

render();

function goHome(){render(products)}

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

function openLogin(){
loginBox.style.display='block';
addOverlay(closeLogin);
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
}

function login(){alert('Demo OK')}

function openContact(){
contactBox.style.display='block';
addOverlay(closeContact);
}

function closeContact(){
contactBox.style.display='none';
removeOverlay();
}


function sendContact(){cStatus.innerText='Đã gửi'}

function openSearch(){
searchOverlay.style.display='flex';
setTimeout(()=>searchInput.focus(),100);
}

function closeSearch(){
searchOverlay.style.display='none';
searchResult.style.display='none';
}

function searchProduct(e){
let input=searchInput.value.toLowerCase();
let result=products.filter(p=>p.name.toLowerCase().includes(input));

let html="";
result.forEach(p=>{
html+=`<div class="search-item" onclick="selectItem('${p.name}')">${p.name}</div>`;
});

if(html==="") html="<div class='search-item'>Không có</div>";

searchResult.innerHTML=html;
searchResult.style.display=input?"block":"none";

if(e.key==='Enter') submitSearch();
}

function selectItem(name){
searchInput.value=name;
searchResult.style.display='none';
}

function submitSearch(){
let value=searchInput.value.toLowerCase();
render(products.filter(p=>p.name.toLowerCase().includes(value)));

// clear input sau khi search
searchInput.value='';

closeSearch();
}

function filterCategory(c){
render(products.filter(p=>p.cat===c));
window.scrollTo({top:0,behavior:'smooth'});
}
// overlay helpers
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

// hover + click animation cho icon
Array.from(document.querySelectorAll('nav a')).forEach(a=>{
  a.addEventListener('mouseenter',()=>a.style.transform='translateY(-1px)');
  a.addEventListener('mouseleave',()=>a.style.transform='none');
});


// ESC để đóng tất cả
 document.addEventListener("keydown",function(e){
   if(e.key==="Escape"){
     closeSearch();
     closeLogin();
     closeContact();
     closeCart();
   }
 });

</script>



<!-- FOOTER XỊN HƠN -->
<footer style="background:#0f5c3a;padding:50px 40px;color:white;margin-top:40px">

<div style="display:grid;grid-template-columns:repeat(4,1fr);gap:40px">

<div>
<h3>ROLEX STORE</h3>
<p style="color:#ccc">Chuyên đồng hồ cao cấp, sang trọng, đẳng cấp.</p>
</div>

<div>
<h4>Menu</h4>
<p onclick="goHome()" style="cursor:pointer">Trang chủ</p>
<p onclick="filterCategory('new')" style="cursor:pointer">Hàng mới</p>
<p onclick="filterCategory('hot')" style="cursor:pointer">Bán chạy</p>
</div>

<div>
<h4>Hỗ trợ</h4>
<p>Email: support@gmail.com</p>
<p>Hotline: 0123 456 789</p>
</div>

<div>
<h4>Kết nối</h4>
<p>Facebook</p>
<p>Instagram</p>
<p>TikTok</p>
</div>

</div>

<hr style="margin:30px 0;border:0;border-top:1px solid rgba(255,255,255,0.2)">

<p style="text-align:center;color:#ccc">© 2026 Rolex Store | Designed by m 😎</p>

</footer>

</body>
</html>
