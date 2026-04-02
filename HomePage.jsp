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
        .left-menu li a.active {
            background: var(--light-bg);
            color: red;
            border-left: 4px solid red;
            padding-left: 30px;
            font-weight: bold;
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
        .img {
            width: 100%;
            height: 200px; /* Chiều cao cố định cho tất cả ảnh */
            margin-bottom: 15px;
            overflow: hidden;
            display: flex;
            align-items: center;
            justify-content: center;
            background-color: #fff;
        }
        .product-card img {
            width: 100%;
            height: 250px;
            object-fit: cover;
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
                <li><a href="<./HomePage.jsp">Trang Chủ</a></li>
                <li><a href="products">Sản Phẩm</a></li>
                <li><a href="contact.jsp">Liên Hệ</a></li>
                <li><a href="cart">Giỏ Hàng</a></li>
                <li><a href="openLogin()">Đăng Nhập</a></li>
            </ul>
        </nav>
    </header>

    <div class="main-container">
        <aside class="left-menu">
            <h3>DANH MỤC</h3>
            <ul>
                <c:forEach items="${listC}" var="p">
                    <li><a class="${cID eq p.id ? "active":""}" href="category?id=${p.id}">${p.cname}</a></li>
                </c:forEach>
            </ul>
            <h3>Hãng</h3>
            <ul>
                <c:forEach items="${listB}" var="b">
                    <li><a class="${bID eq b.id ? "active":""}" href="brand?id=${b.id}">${b.bname}</a></li>
                </c:forEach>
            </ul>
        </aside>

        <section class="content">
            <h2 class="title-section">TẤT CẢ SẢN PHẨM</h2>
            <div class="product-grid">
                <c:forEach items="${listP}" var="p">
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
            
            <h2 class="title-section">HÀNG MỚI VỀ</h2>
            <div class="product-grid">
                <c:forEach items="${listN}" var="p">
                    <div class="product-card">
                        <img src="${p.image}" alt="${p.name}">
                        <h4>${p.name}</h4>
                        <fmt:setLocale value="vi_VN"/>
                        <p class="price"><fmt:formatNumber value="${p.price}" type="number"/> VNĐ</p>
                        <a href="detail?id=${p.id}" class="btn-detail">Xem Chi Tiết</a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
    <footer>
        <p class="team-info">Phát triển bởi: <strong>Hà Đức Anh & Đinh Ngọc Dũng & Nguyễn Trung Kiên</strong></p>
        <p>Hệ thống phân phối đồng hồ chính hãng hàng đầu Việt Nam</p>
        <p>&copy; 2026 Luxury Watch Store. All Rights Reserved.</p>
    </footer>
</body>
</html>