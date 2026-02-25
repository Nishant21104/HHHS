<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="OCR.Admin.Dashboard" %>
<%--commented from here--%> 
<%--<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url("https://fonts.googleapis.com/css2?family=Nunito:wght@200;300;400;500;600;700;800;900;1000&family=Roboto:wght@300;400;500;700&display=swap");

        :root {
            --bg-body: rgb(245, 247, 255);
            --primary-color: rgb(42, 51, 65);
            --primary-hover-color: rgb(158, 161, 166);
            --scrollbar-color: rgba(131, 135, 193, 0.4);
            --card-bg-color: rgba(230, 231, 247, 0.1);
            --pop-bg-color: rgb(245, 247, 255, 0.9);
            --star-color: #ddcc14;
            --border-color: rgba(131, 135, 193, 0.4);
            --shadow-color: rgba(0, 0, 0, 0.05);
            --accent-color: rgb(194, 33, 105);
        }

        .darkmode {
            --bg-body: rgb(6, 5, 40);
            --primary-color: rgb(248, 248, 248);
            --primary-hover-color: rgb(159, 159, 159);
            --scrollbar-color: rgba(44, 49, 88, 0.7);
            --card-bg-color: rgb(24, 26, 50);
            --star-color: #a1d31a;
            --border-color: rgba(189, 192, 234, 0.4);
            --shadow-color: rgba(208, 195, 226, 0.13);
            --accent-color: rgb(185, 129, 250);
        }

        @media (prefers-color-scheme: dark) {
            .theme {
                background-color: rgb(6, 5, 40);
                color: rgb(248, 248, 248);
            }
        }

        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        * {
            padding: 0;
            margin: 0;
            font-family: "Nunito", sans-serif;
        }

        nav {
            user-select: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
        }

        ul,
        ul li {
            outline: 0;
            list-style: none;
        }

            ul li a {
                text-decoration: none;
            }

        img {
            width: 100%;
        }

        h1 {
            font-size: clamp(1rem, 4vw, 1.2rem);
        }

        h2 {
            font-size: clamp(0.9rem, 4vw, 1rem);
        }

        body {
            position: relative;
            background: var(--bg-body);
            overflow: hidden;
        }

        /* MAIN MENU */

        .main-menu {
            position: fixed;
            top: 0;
            left: 0;
            width: 180px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border-right: 1px solid var(--border-color);
            padding: 12px 0 10px;
            overflow: hidden;
            font-family: inherit;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 5px;
        }

            .user-info img {
                max-width: 160px;
                aspect-ratio: 1/1;
                object-fit: cover;
                border-radius: 50%;
                padding: 20px;
            }

            .user-info p {
                color: var(--primary-color);
                font-size: clamp(0.8rem, 3vw, 1rem);
                font-weight: 500;
                text-align: center;
                line-height: 1.3;
                margin: -15px 0 30px;
            }

        .nav-item {
            display: block;
        }

            .nav-item a {
                display: flex;
                align-items: center;
                justify-content: center;
                color: var(--primary-color);
                font-size: 1rem;
                padding: 12px 0;
                margin: 0 8px;
                border-radius: 5px;
            }

            .nav-item.active a {
                background: rgba(106, 109, 155, 0.4);
                text-decoration: none;
                box-shadow: 0px 1px 4px var(--shadow-color);
            }

        .nav-icon {
            width: 40px;
            height: 20px;
            font-size: 1.1rem;
        }

        .nav-text {
            display: block;
            width: 70px;
            height: 20px;
            letter-spacing: 0;
        }

        /* CONTENT */

        .content {
            position: absolute;
            top: 0;
            left: 180px;
            right: 0;
            min-height: 100vh;
            display: grid;
            grid-template-columns: 75% 25%;
        }

        .card {
            background-color: var(--card-bg-color);
            border-radius: 8px;
            border: 2px solid rgba(169, 150, 253, 0.5);
            box-shadow: 0px 4px 5px 0px var(--shadow-color), 0px 1px 8px 0px var(--shadow-color), 0px 2px 4px -1px var(--shadow-color);
        }

        /* LEFT CONTENT */

        .left-content {
            padding: 25px 20px 40px;
            color: var(--primary-color);
            height: 100vh;
            overflow: auto;
        }

        /* SEARCH */

        .search-box {
            position: relative;
            display: flex;
        }

            .search-box input {
                width: 80%;
                height: 40px;
                background: var(--card-bg-color);
                color: var(--primary-color);
                outline: 2px solid var(--border-color);
                border: 0;
                border-radius: 8px;
                font-size: 1rem;
                font-weight: 500;
                letter-spacing: 0.6px;
                padding: 8px 30px 8px 15px;
                margin: 0 auto;
            }

                .search-box input[type="text"]::placeholder {
                    color: var(--primary-color);
                    opacity: 0.5;
                    font-weight: 400;
                }

            .search-box i {
                position: absolute;
                right: 11%;
                top: 25%;
                font-size: 1.3rem;
                color: var(--primary-color);
                cursor: pointer;
            }

        /* HEADER */

        .header {
            margin: 0 auto;
            width: 100%;
        }

        .header-mobile,
        .header-tablet {
            display: none;
        }

        .header-desktop {
            display: block;
        }

        /* UPCOMING EVENTS */

        .upcoming-events h1 {
            margin: 16px 0 10px;
        }

        .event-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(240px, 1fr));
            gap: 20px;
            padding: 14px 0 20px;
        }

        .event-card {
            display: grid;
            grid-auto-flow: dense;
            grid-template-rows: 2fr 0.8fr 0.5fr;
            padding: 8px;
        }

        /* Event Header */

        .event-header {
            position: relative;
            height: 180px;
            margin-bottom: 8px;
        }

            .event-header img {
                position: relative;
                inset: 0;
                width: 100%;
                height: 180px;
                border-radius: 6px;
                border: 2px solid rgba(125, 125, 137, 0.5);
                object-fit: cover;
            }

            .event-header p {
                position: absolute;
                right: 4px;
                bottom: 4px;
                font-size: 0.8rem;
                color: rgb(240, 248, 255);
                background-color: rgba(17, 16, 45, 0.6);
                padding: 4px 6px;
                border-radius: 3px;
                box-shadow: 0 8px 20px rgba(74, 72, 72, 0.1);
            }

        .bx-heart,
        .bxs-heart {
            position: absolute;
            right: 10px;
            top: 10px;
            font-size: 1.4rem;
            color: rgb(240, 248, 255);
            background-color: rgba(17, 16, 45, 0.6);
            padding: 4px;
            border-radius: 50%;
            box-shadow: 0 8px 20px rgba(74, 72, 72, 0.1);
            cursor: pointer;
        }

        .bounce-in {
            animation: pulse 0.8s 1 ease-in-out alternate;
        }

        @keyframes pulse {
            0%, 100% {
                transform: scale(1);
            }

            50% {
                transform: scale(1.2);
            }
        }

        /* Event Content */

        .event-content {
            display: grid;
            grid-auto-flow: dense;
            grid-template-rows: 2fr 1fr;
            padding: 6px 6px 12px;
        }

            .event-content h2 {
                margin-bottom: 6px;
                line-height: 1.3;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;

                @supports (-webkit-line-clamp: 2) {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: initial;
                    display: -webkit-box;
                    -webkit-line-clamp: 2;
                    -webkit-box-orient: vertical;
                }
            }

            .event-content p {
                font-size: clamp(0.8rem, 4vw, 0.9rem);
                opacity: 0.8;
            }

        /* Event Footer */

        .event-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 4px;
        }

            .event-footer p {
                color: rgb(240, 248, 255);
                font-size: clamp(0.6rem, 3vw, 0.8rem);
                font-weight: 600;
                letter-spacing: 1px;
                padding: 6px 10px;
                border-radius: 50px;
            }

        .btn-group {
            display: inline-flex;
        }

        .event-footer button {
            background-color: rgb(51, 108, 215);
            color: rgb(240, 248, 255);
            padding: 5px 10px;
            outline: 0;
            border: 2px solid rgb(51, 108, 215);
            border-radius: 4px;
            font-size: clamp(0.6rem, 3vw, 0.8rem);
            font-weight: 500;
            margin-left: 3px;
            transition: all 0.4s ease-in-out;
            cursor: pointer;
        }

            .event-footer button:hover {
                background-color: rgb(90, 139, 231);
                border: 2px solid rgb(151, 177, 226);
            }

        /* Share Button Popup */

        .share {
            position: relative;
        }

        .popup {
            position: absolute;
            display: flex;
            justify-content: space-around;
            align-items: center;
            top: -45px;
            left: -15px;
            min-width: 70px;
            padding: 5px 8px 3px;
            border-radius: 10px;
            background-color: var(--pop-bg-color);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            opacity: 0;
            transform: translateY(50px) scale(0);
            -webkit-transform: translateY(50px) scale(0);
            transition: 0.4s ease-in-out;
            -webkit-transition: 0.4s ease-in-out;
            cursor: auto;
        }

            .popup.active {
                opacity: 1;
                transform: translateY(0) scale(1);
                -webkit-transform: translateY(0) scale(1);
            }

            .popup::after {
                content: "";
                position: absolute;
                height: 10px;
                width: 20px;
                background-color: var(--pop-bg-color);
                clip-path: polygon(100% 0, 0 0, 50% 100%);
                -webkit-clip-path: polygon(100% 0, 0 0, 50% 100%);
                transform: translate(0px, 20px);
                -webkit-transform: translate(0px, 20px);
            }

            .popup li a i {
                font-size: 1.4rem;
            }

        /* REVIEWS */

        .reviews h1 {
            margin: 60px 0 20px;
        }

        .review-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .review-card {
            padding: 20px;
        }

            .review-card h2 {
                margin-bottom: 8px;
            }

            .review-card p {
                margin-top: 10px;
                line-height: 1.5;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;

                @supports (-webkit-line-clamp: 3) {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: initial;
                    display: -webkit-box;
                    -webkit-line-clamp: 3;
                    -webkit-box-orient: vertical;
                }
            }

        .ratings i {
            color: var(--star-color);
            font-size: 1.15rem;
        }

        /* RIGHT CONTENT */

        .right-content {
            display: flex;
            flex-direction: column;
            border-left: 1px solid var(--border-color);
            padding: 25px 20px;
            color: var(--primary-color);
            height: 100vh;
            overflow: auto;
        }

        /* INTERACTION CONTROL */

        .interaction-control-mobile {
            display: none;
        }

        .interaction-control {
            display: flex;
            margin-bottom: 15px;
        }

        .interactions {
            justify-content: flex-end;
            align-items: center;
            gap: 25px;
        }

            .interactions i {
                font-size: 1.25rem;
                color: var(--primary-color);
                user-select: none;
            }

        .notified {
            position: relative;
        }

            .notified::after {
                content: "";
                position: absolute;
                top: -3px;
                right: -1px;
                background-color: rgb(211, 17, 43);
                width: 10px;
                aspect-ratio: 1/1;
                border-radius: 50%;
            }

        .fa-envelope::after {
            right: -4px;
            background-color: rgb(48, 153, 36);
        }

        /* Light/Dark Mode */

        .mode-icon i {
            color: var(--primary-color);
            transform: translateY(2px);
            transition: all 0.2s linear;
            cursor: pointer;
        }

            .mode-icon i:hover {
                color: var(--primary-hover-color);
            }

        .hidden {
            display: none;
        }

        /* ANALYTICS */

        .analytics h1 {
            margin-bottom: 24px;
        }

        /* Total Events */

        .total-events {
            display: flex;
            flex-direction: row;
            gap: 10px;
        }

        .event-number {
            position: relative;
            display: grid;
            grid-auto-flow: dense;
            grid-template-rows: 1fr 0.5fr;
            width: 100%;
            padding: 10px;
        }

            .event-number p {
                font-size: clamp(1.5rem, 4vw, 2rem);
                color: var(--accent-color);
            }

            .event-number i {
                position: absolute;
                right: 8px;
                bottom: 6px;
                font-size: 2.5rem;
            }

        /* Chart */

        .chart {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            background: var(--card-bg-color);
            border-radius: 8px;
            border: 2px solid rgba(169, 150, 253, 0.5);
            box-shadow: 0 7px 25px var(--shadow-color);
            padding: 20px 15px;
            margin: 20px 0;
        }

            .chart h2 {
                text-align: center;
                margin-bottom: 10px;
            }

            .chart ul {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
                gap: 10px;
                list-style: none;
                margin: 10px 0;
            }

                .chart ul li {
                    font-size: 0.8rem;
                    font-weight: 500;
                    background-color: var(--card-bg-color);
                    border: 2px solid var(--border-color);
                    border-radius: 6px;
                    padding: 6px;
                    box-shadow: 0px 2px 3px 0px var(--shadow-color), 0px 1px 4px 0px var(--shadow-color), 0px 2px 1px -1px var(--shadow-color);
                }

            .chart .percentage {
                font-weight: 700;
                color: var(--accent-color);
            }

        /* CONTACTS */

        .contacts h1 {
            margin: 20px 0;
        }

        .contact-status {
            display: flex;
            flex-direction: column;
            padding: 5px 0;
            border-bottom: 2px solid var(--border-color);
            margin-bottom: 15px;
        }

            .contact-status:last-child {
                border-bottom: unset;
            }

        .contact-activity {
            display: flex;
            align-items: center;
            column-gap: 14px;
        }

            .contact-activity img {
                max-width: 45px;
                aspect-ratio: 1/1;
                border-radius: 50%;
                object-fit: cover;
            }

            .contact-activity p {
                font-size: 0.9rem;
                line-height: 1.5;
                padding-right: 10px;
            }

                .contact-activity p span {
                    font-weight: 700;
                    color: var(--accent-color);
                    margin-left: 2px;
                    cursor: pointer;
                }

                    .contact-activity p span:hover {
                        text-decoration: underline;
                        text-decoration-color: var(--accent-color);
                        text-decoration-thickness: 1.5px;
                    }

        .contact-status small {
            font-size: 0.8rem;
            opacity: 0.5;
            margin-left: auto;
        }

        /* SCROLLBAR STYLE */

        .left-content::-webkit-scrollbar,
        .right-content::-webkit-scrollbar,
        body::-webkit-scrollbar {
            width: 8px;
        }

        .left-content::-webkit-scrollbar-track,
        .right-content::-webkit-scrollbar-track,
        body::-webkit-scrollbar-track {
            border-radius: 0;
        }

        .left-content::-webkit-scrollbar-thumb,
        .right-content::-webkit-scrollbar-thumb,
        body::-webkit-scrollbar-thumb {
            background-color: var(--scrollbar-color);
            border-radius: 40px;
        }

        /* MEDIA QUERIES */

        @media (max-width: 1500px) {
            .main-menu {
                width: 100px;
            }

            .user-info img {
                padding: 12px;
            }

            .user-info p {
                line-height: 1.1;
                margin: -5px 0 30px;
            }

            .nav-icon {
                text-align: center;
                transform: translateY(2px);
            }

            .nav-text {
                display: none;
            }

            .content {
                left: 100px;
                grid-template-columns: 70% 30%;
            }
        }

        @media (max-width: 1120px) {
            .content {
                grid-template-columns: 65% 35%;
            }

            .event-number i {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 1120px) {
            .search-box input {
                width: 100%;
            }

            .search-box i {
                right: 2%;
            }
        }

        @media (max-width: 980px) {
            .content {
                grid-template-columns: 60% 40%;
            }

            .header-mobile,
            .header-desktop {
                display: none;
            }

            .header-tablet {
                display: block;
            }

            .chart {
                padding: 20px 10px;
            }
        }

        @media (max-width: 840px) {
            .content {
                grid-template-columns: 55% 45%;
            }

            .event-number i {
                font-size: 2rem;
            }
        }

        @media (max-width: 825px) {
            .left-content {
                padding: 25px 20px 20px;
            }

            .review-container {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            }
        }

        @media (max-width: 760px) {
            body {
                overflow: auto;
            }

            .main-menu {
                width: 70px;
            }

            .user-info img {
                max-width: 80px;
            }

            .user-info p {
                line-height: 1.1;
                margin: -10px 0 30px;
            }

            .nav-item a {
                padding: 8px 0;
            }

            .content {
                left: 70px;
                grid-template-columns: 100%;
                grid-template-areas: "leftContent" "rightContent";
                overflow: auto;
            }

            .left-content {
                grid-area: leftContent;
                height: auto;
                overflow: unset;
            }

            .header-mobile,
            .header-tablet {
                display: none;
            }

            .header-desktop {
                display: block;
            }

            .review-container {
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            }

            .right-content {
                grid-area: rightContent;
                border-left: unset;
                height: auto;
                overflow: unset;
            }

            .chart {
                width: 50%;
                margin: 20px auto;
            }

            .search-and-check {
                display: flex;
                align-items: center;
                gap: 40px;
                margin-bottom: 20px;
            }

            .search-box {
                flex-grow: 1;
            }

            .interaction-control {
                display: none;
            }

            .interaction-control-mobile {
                display: inline-flex;
            }

            .interactions {
                gap: 15px;
            }
        }

        @media (max-width: 650px) {
            .chart {
                width: 65%;
            }
        }

        @media (max-width: 610px) {
            .header-mobile,
            .header-desktop {
                display: none;
            }

            .header-tablet {
                display: block;
            }
        }

        @media (max-width: 550px) {
            .user-info {
                padding: 3px;
            }

            .header img {
                aspect-ratio: 4/2;
                height: 100%;
            }

            .chart {
                width: 80%;
            }

            .search-and-check {
                gap: 20px;
            }

            .interactions {
                gap: 10px;
            }

                .interactions i {
                    font-size: 1.1rem;
                }

            .mode-icon i {
                font-size: 1.4rem;
            }
        }

        @media (max-width: 450px) {
            .header-tablet,
            .header-desktop {
                display: none;
            }

            .header-mobile {
                display: block;
            }

            .bx-heart,
            .bxs-heart {
                font-size: 1.2rem;
            }

            .review-container {
                gap: 20px;
            }

            .search-box input {
                height: 30px;
                font-size: 0.8rem;
                padding: 8px 30px 8px 10px;
            }

            .search-box i {
                top: 20%;
                font-size: 1.1rem;
            }
        }

        @media (max-width: 400px) {
            .main-menu {
                width: 60px;
            }

            .user-info {
                padding: 0;
            }

            .nav-icon {
                font-size: 0.9rem;
            }

            .content {
                left: 60px;
            }

            .review-container {
                grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            }

            .chart {
                width: 100%;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">--%>
<%-- till here --%>

    <%--<div class="cards-row">
        <div class="card">
            <img src='https://getmdl.io/assets/demos/welcome_card.jpg' class="card-image" id="img1" runat="server"/>
            <div class="card-title">
                This is title.
            </div>
            <div class="card-desc" id="div1" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus iusto s deleniti ea atque. Nostrum odio temporibus nisi inventore, velit hic in quas quos quo?
            </div>
            <div class="card-actions">
                <button type='button' class='card-action-readMore'>Read More</button>
            </div>
        </div>

        <div class="card">
            <img src='https://getmdl.io/assets/demos/welcome_card.jpg' class="card-image" id="img2" runat="server"/>
            <div class="card-title">
                This is title.
            </div>
            <div class="card-desc" id="div2" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus iusto sit, aperiam officia laborum labore voluptatibus deleniti ea atque. Nostrum odio temporibus nisi inventore, velit hic in quas quos quo?
            </div>
            <div class="card-actions">
                <button type='button' class='card-action-readMore'>Read More</button>
            </div>
        </div>
        <div class="card">
            <img src='https://getmdl.io/assets/demos/welcome_card.jpg' class="card-image" id="img3" runat="server"/>
            <div class="card-title">
                This is title.
            </div>
            <div class="card-desc" id="div3" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus iusto sit, aperiam officia laborum labore voluptatibus deleniti ea atque. Nostrum odio temporibus nisi inventore, velit hic in quas quos quo?
            </div>
            <div class="card-actions">
                <button type='button' class='card-action-readMore'>Read More</button>
            </div>
        </div>
    </div>--%>

<%-- commented from here --%>
<%--    <section class="content" style="margin-top: 0px; bottom: 0px; padding-bottom: 0px; padding-top: 0px; left: 0px;">
        <div class="left-content" style="padding-top: 0px; padding-bottom: 0px;">
            <div class="search-and-check">

                <div class="interaction-control-mobile interactions">
                    <i class="fa-regular fa-envelope notified"></i>
                    <i class="fa-regular fa-bell notified"></i>
                    <div class="toggle" onclick="switchTheme()">
                        <div class="mode-icon moon">
                            <i class="bx bxs-moon"></i>
                        </div>
                        <div class="mode-icon sun hidden">
                            <i class="bx bxs-sun"></i>
                        </div>
                    </div>
                </div>
            </div>
            <div class="upcoming-events">
                <h1>New Users</h1>
                <div class="event-container">
                    <div class="card event-card">
                        <div class="event-header">
                            <asp:Image ID="imgNGO" runat="server" />
                            <p id="pNDate" runat="server"></p>
                            <i class="bx bx-heart like-btn"></i>
                        </div>
                        <div class="event-content">
                            <h2 id="hNGO" runat="server"></h2>
                            <p id="pNGO" runat="server"></p>
                        </div>
                        <div class="event-footer">
                            <div class="btn-group">
                                 <button onclick="window.open('ViewNGO.aspx');">Approve pending NGO's</button>                                
                            </div>
                        </div>
                    </div>

                    <div class="card event-card">
                        <div class="event-header">
                            <asp:Image ID="imgDonor" runat="server" />
                            <p id="pDDate" runat="server"></p>
                            <i class="bx bxs-heart like-btn"></i>
                        </div>
                        <div class="event-content">
                            <h2 id="hDonor" runat="server"></h2>
                            <p id="pDonor" runat="server"></p>
                            
                        </div>
                        <div class="event-footer">
                           
                            <div class="btn-group">
                                <button onclick="window.open('ViewDonor.aspx');">Approve pending Donors</button>
                            </div>
                        </div>
                    </div>

                    <div class="card event-card">
                        <div class="event-header">
                            <asp:Image ID="imgFundRaiser" runat="server" />
                            <p id="pFDate" runat="server"></p>
                            <i class="bx bx-heart like-btn"></i>
                        </div>
                        <div class="event-content">
                            <h2 id="hFund" runat="server"></h2>
                            <p id="pFund" runat="server"></p>
                        </div>
                        <div class="event-footer">

                            <div class="btn-group">
                                <button onclick="window.open('ViewFundRaiser.aspx');">Approve pending FundRaisers</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="right-content">
            <div class="interaction-control interactions">
                <i class="fa-regular fa-envelope notified"></i>
                <i class="fa-regular fa-bell notified"></i>
                <div class="toggle" onclick="switchTheme()">
                    <div class="mode-icon moon">
                        <i class="bx bxs-moon"></i>
                    </div>
                    <div class="mode-icon sun hidden">
                        <i class="bx bxs-sun"></i>
                    </div>
                </div>
            </div>

            <div class="analytics">
                <h1>Analytics</h1>
                <div class="analytics-container">
                    <div class="total-events">
                        <div class="event-number card">
                            <h2>Top Donors</h2>
                            <p id="donorCount" runat="server"></p>
                            <i class="bx bx-check-circle"></i>
                        </div>
                        <div class="event-number card">
                            <h2>Top NGO</h2>
                            <p id="ngoCount" runat="server"></p>
                            <i class="bx bx-timer"></i>
                        </div>
                        <div class="event-number card">
                            <h2>Top Fundraiser</h2>
                            <p id="fundRaiserCount" runat="server"></p>
                            <i class="bx bx-timer"></i>
                        </div>
                    </div>

                    
                </div>
            </div>--%>
<%-- till here --%>



            <%--<div class="contacts">
                <h1>Contact of Users</h1>
                <div class="contacts-container">
                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/e56800db-687d-4d0e-a470-51e37a4431c7" alt="" />
                            <p>Matt favored <span>Jazz Fusion Night</span></p>
                        </div>
                        <small>1 hour ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/fac9f27b-c1ea-4bba-973f-88996322fa2d" alt="" />
                            <p>
                                Bella bought a ticket for
                <span>Acoustic Serenade Under the Stars</span>
                            </p>
                        </div>
                        <small>4 hours ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/1499d73c-ccc0-41a1-b530-1d629012aebd" alt="" />
                            <p>
                                Lucas bought a ticket for
                <span>Wimbledon Championships - 2024</span>
                            </p>
                        </div>
                        <small>1 day ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/949768d4-0196-486c-b386-edb47ddd54c2" alt="" />
                            <p>
                                Sophia favored
                <span>Clay Sculpting Class</span>
                            </p>
                        </div>
                        <small>1 day ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/8a470b8b-b5cf-4189-b36e-f22551997ff4" alt="" />
                            <p>
                                Kate bought a ticket for
                <span>Latin Rhythms Fusion</span>
                            </p>
                        </div>
                        <small>3 day ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/7740acc0-3f86-4c28-8a8c-5ae67c343edb" alt="" />
                            <p>
                                Ben favored
                <span>Harry Potter Film Concert Series</span>
                            </p>
                        </div>
                        <small>6 day ago</small>
                    </div>
                </div>
            </div>--%>
      <%--  </div>

    </section>
</asp:Content>--%> 
<%-- commented --%>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        @import url("https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap");

        :root {
            --bg-body: linear-gradient(135deg, #667eea 0%, #1f76bd 100%);
            --primary-color: #1a202c;
            --primary-hover-color: #4a5568;
            --card-bg: rgba(255, 255, 255, 0.95);
            --card-border: rgba(255, 255, 255, 0.2);
            --accent-color: #667eea;
            --success-color: #48bb78;
            --warning-color: #ed8936;
            --danger-color: #f56565;
            --text-muted: #718096;
            --shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            --shadow-hover: 0 20px 40px rgba(0, 0, 0, 0.15);
        }

        @media (prefers-color-scheme: dark) {
            .theme {
                background-color: rgb(6, 5, 40);
                color: rgb(248, 248, 248);
            }
        }

        *,
        *::before,
        *::after {
            box-sizing: border-box;
        }

        * {
            padding: 0;
            margin: 0;
            font-family: "Nunito", sans-serif;
        }

        nav {
            user-select: none;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
            -o-user-select: none;
        }

        ul,
        ul li {
            outline: 0;
            list-style: none;
        }

            ul li a {
                text-decoration: none;
            }

        img {
            width: 100%;
        }

        h1 {
            font-size: clamp(1rem, 4vw, 1.2rem);
        }

        h2 {
            font-size: clamp(0.9rem, 4vw, 1rem);
        }

        body {
            position: relative;
            background: var(--bg-body);
            overflow: hidden;
            font-family: 'Inter', sans-serif;
            color: var(--primary-color);
        }

        /* MAIN MENU */
        .main-menu {
            position: fixed;
            top: 0;
            left: 0;
            width: 220px;
            height: 100%;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
            border-right: 1px solid var(--card-border);
            padding: 20px 0;
            overflow: hidden;
            background: rgba(255, 255, 255, 0.1);
            backdrop-filter: blur(20px);
            z-index: 100;
        }

        .user-info {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 12px;
            padding: 0 20px;
        }

            .user-info img {
                max-width: 120px;
                aspect-ratio: 1/1;
                object-fit: cover;
                border-radius: 50%;
                border: 3px solid var(--card-border);
                padding: 8px;
                background: var(--card-bg);
                box-shadow: var(--shadow);
            }

            .user-info p {
                color: white;
                font-size: 14px;
                font-weight: 600;
                text-align: center;
                line-height: 1.4;
                margin: 8px 0 20px;
            }

        .nav-item {
            display: block;
            margin: 4px 12px;
        }

            .nav-item a {
                display: flex;
                align-items: center;
                color: rgba(255, 255, 255, 0.8);
                font-size: 14px;
                font-weight: 500;
                padding: 12px 16px;
                border-radius: 12px;
                transition: all 0.3s ease;
            }

            .nav-item a:hover {
                background: rgba(255, 255, 255, 0.15);
                color: white;
                transform: translateX(4px);
            }

            .nav-item.active a {
                background: var(--accent-color);
                color: white;
                box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
            }

        .nav-icon {
            width: 24px;
            height: 24px;
            font-size: 18px;
            margin-right: 12px;
        }

        .nav-text {
            display: block;
            font-weight: 500;
        }

        /* CONTENT */
        .content {
            position: absolute;
            top: 0;
            left: 220px;
            right: 0;
            min-height: 100vh;
            display: grid;
            grid-template-columns: 70% 30%;
            gap: 0;
        }

        .card {
            background: var(--card-bg);
            border-radius: 16px;
            border: 1px solid var(--card-border);
            box-shadow: var(--shadow);
            backdrop-filter: blur(20px);
            transition: all 0.3s ease;
        }

        .card:hover {
            box-shadow: var(--shadow-hover);
            transform: translateY(-2px);
        }

        /* LEFT CONTENT */
        .left-content {
            padding: 30px;
            color: var(--primary-color);
            height: 100vh;
            overflow: auto;
        }

        /* SEARCH */
        .search-box {
            position: relative;
            display: flex;
            margin-bottom: 30px;
        }

            .search-box input {
                width: 100%;
                height: 48px;
                background: var(--card-bg);
                color: var(--primary-color);
                border: 2px solid var(--card-border);
                border-radius: 12px;
                font-size: 14px;
                font-weight: 500;
                padding: 12px 50px 12px 20px;
                transition: all 0.3s ease;
            }

                .search-box input:focus {
                    outline: none;
                    border-color: var(--accent-color);
                    box-shadow: 0 0 0 4px rgba(102, 126, 234, 0.1);
                }

                .search-box input[type="text"]::placeholder {
                    color: var(--text-muted);
                    font-weight: 400;
                }

            .search-box i {
                position: absolute;
                right: 20px;
                top: 50%;
                transform: translateY(-50%);
                font-size: 18px;
                color: var(--text-muted);
                cursor: pointer;
                transition: color 0.3s ease;
            }

            .search-box i:hover {
                color: var(--accent-color);
            }

        /* HEADER */

        .header {
            margin: 0 auto;
            width: 100%;
        }

        .header-mobile,
        .header-tablet {
            display: none;
        }

        .header-desktop {
            display: block;
        }

        /* UPCOMING EVENTS */
        .upcoming-events h1 {
            margin: 20px 0 24px;
            font-size: 24px;
            font-weight: 700;
            color: white;
        }

        .event-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 24px;
            padding: 10px 0 32px;
        }

        .event-card {
            display: grid;
            grid-auto-flow: dense;
            grid-template-rows: auto 1fr auto;
            padding: 0;
            overflow: hidden;
        }

        /* Event Header */
        .event-header {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

            .event-header img {
                position: relative;
                inset: 0;
                width: 100%;
                height: 200px;
                object-fit: cover;
                transition: transform 0.3s ease;
            }

            .event-card:hover .event-header img {
                transform: scale(1.05);
            }

            .event-header p {
                position: absolute;
                right: 12px;
                bottom: 12px;
                font-size: 12px;
                color: white;
                background: rgba(0, 0, 0, 0.7);
                padding: 6px 12px;
                border-radius: 20px;
                font-weight: 600;
                backdrop-filter: blur(10px);
            }

        .bx-heart,
        .bxs-heart {
            position: absolute;
            right: 12px;
            top: 12px;
            font-size: 20px;
            color: white;
            background: rgba(0, 0, 0, 0.7);
            padding: 8px;
            border-radius: 50%;
            cursor: pointer;
            transition: all 0.3s ease;
            backdrop-filter: blur(10px);
        }

        .bx-heart:hover,
        .bxs-heart:hover {
            background: var(--danger-color);
            transform: scale(1.1);
        }

        /* Event Content */
        .event-content {
            display: grid;
            grid-auto-flow: dense;
            grid-template-rows: auto 1fr;
            padding: 20px;
        }

            .event-content h2 {
                margin-bottom: 8px;
                line-height: 1.3;
                font-size: 18px;
                font-weight: 600;
                color: var(--primary-color);
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;
            }

            .event-content p {
                font-size: 14px;
                color: var(--text-muted);
                line-height: 1.5;
                margin: 0;
            }

        /* Event Footer */
        .event-footer {
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 20px 20px;
        }

            .event-footer p {
                color: var(--text-muted);
                font-size: 12px;
                font-weight: 500;
            }

        .btn-group {
            display: inline-flex;
        }

        .event-footer button {
            background: var(--accent-color);
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

            .event-footer button:hover {
                background: #5a67d8;
                transform: translateY(-1px);
                box-shadow: 0 4px 12px rgba(102, 126, 234, 0.3);
            }

        /* Share Button Popup */

        .share {
            position: relative;
        }

        .popup {
            position: absolute;
            display: flex;
            justify-content: space-around;
            align-items: center;
            top: -45px;
            left: -15px;
            min-width: 70px;
            padding: 5px 8px 3px;
            border-radius: 10px;
            background-color: var(--pop-bg-color);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.4);
            opacity: 0;
            transform: translateY(50px) scale(0);
            -webkit-transform: translateY(50px) scale(0);
            transition: 0.4s ease-in-out;
            -webkit-transition: 0.4s ease-in-out;
            cursor: auto;
        }

            .popup.active {
                opacity: 1;
                transform: translateY(0) scale(1);
                -webkit-transform: translateY(0) scale(1);
            }

            .popup::after {
                content: "";
                position: absolute;
                height: 10px;
                width: 20px;
                background-color: var(--pop-bg-color);
                clip-path: polygon(100% 0, 0 0, 50% 100%);
                -webkit-clip-path: polygon(100% 0, 0 0, 50% 100%);
                transform: translate(0px, 20px);
                -webkit-transform: translate(0px, 20px);
            }

            .popup li a i {
                font-size: 1.4rem;
            }

        /* REVIEWS */

        .reviews h1 {
            margin: 60px 0 20px;
        }

        .review-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 30px;
        }

        .review-card {
            padding: 20px;
        }

            .review-card h2 {
                margin-bottom: 8px;
            }

            .review-card p {
                margin-top: 10px;
                line-height: 1.5;
                white-space: nowrap;
                text-overflow: ellipsis;
                overflow: hidden;

                @supports (-webkit-line-clamp: 3) {
                    overflow: hidden;
                    text-overflow: ellipsis;
                    white-space: initial;
                    display: -webkit-box;
                    -webkit-line-clamp: 3;
                    -webkit-box-orient: vertical;
                }
            }

        .ratings i {
            color: var(--star-color);
            font-size: 1.15rem;
        }

        /* RIGHT CONTENT */
        .right-content {
            display: flex;
            flex-direction: column;
            border-left: 1px solid var(--card-border);
            padding: 30px 20px;
            color: var(--primary-color);
            height: 100vh;
            overflow: auto;
            background: rgba(255, 255, 255, 0.05);
        }

        /* INTERACTION CONTROL */
        .interaction-control {
            display: flex;
            justify-content: flex-end;
            align-items: center;
            gap: 20px;
            margin-bottom: 24px;
        }

        .interactions {
            display: flex;
            align-items: center;
            gap: 16px;
        }

            .interactions i {
                font-size: 20px;
                color: rgba(255, 255, 255, 0.8);
                cursor: pointer;
                transition: all 0.3s ease;
            }

            .interactions i:hover {
                color: white;
                transform: scale(1.1);
            }

        .notified {
            position: relative;
        }

            .notified::after {
                content: "";
                position: absolute;
                top: -4px;
                right: -4px;
                background: var(--danger-color);
                width: 8px;
                aspect-ratio: 1/1;
                border-radius: 50%;
            }

        /* ANALYTICS */
        .analytics h1 {
            margin-bottom: 24px;
            font-size: 20px;
            font-weight: 700;
            color: var(--primary-color);
        }

        /* Total Events */
        .total-events {
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .event-number {
            position: relative;
            display: grid;
            grid-auto-flow: dense;
            grid-template-rows: auto 1fr;
            width: 100%;
            padding: 20px;
            transition: all 0.3s ease;
        }

        .event-number:hover {
            transform: translateY(-2px);
            box-shadow: var(--shadow-hover);
        }

            .event-number h2 {
                font-size: 14px;
                font-weight: 600;
                color: var(--primary-color);
                margin-bottom: 8px;
            }

            .event-number p {
                font-size: 28px;
                font-weight: 700;
                color: var(--accent-color);
                margin: 0;
            }

            .event-number i {
                position: absolute;
                right: 16px;
                bottom: 16px;
                font-size: 32px;
                color: var(--accent-color);
                opacity: 0.3;
            }

        /* Chart */

        .chart {
            display: flex;
            flex-direction: column;
            align-items: center;
            width: 100%;
            background: var(--card-bg-color);
            border-radius: 8px;
            border: 2px solid rgba(169, 150, 253, 0.5);
            box-shadow: 0 7px 25px var(--shadow-color);
            padding: 20px 15px;
            margin: 20px 0;
        }

            .chart h2 {
                text-align: center;
                margin-bottom: 10px;
            }

            .chart ul {
                display: flex;
                justify-content: center;
                align-items: center;
                flex-wrap: wrap;
                gap: 10px;
                list-style: none;
                margin: 10px 0;
            }

                .chart ul li {
                    font-size: 0.8rem;
                    font-weight: 500;
                    background-color: var(--card-bg-color);
                    border: 2px solid var(--border-color);
                    border-radius: 6px;
                    padding: 6px;
                    box-shadow: 0px 2px 3px 0px var(--shadow-color), 0px 1px 4px 0px var(--shadow-color), 0px 2px 1px -1px var(--shadow-color);
                }

            .chart .percentage {
                font-weight: 700;
                color: var(--accent-color);
            }

        /* CONTACTS */

        .contacts h1 {
            margin: 20px 0;
        }

        .contact-status {
            display: flex;
            flex-direction: column;
            padding: 5px 0;
            border-bottom: 2px solid var(--border-color);
            margin-bottom: 15px;
        }

            .contact-status:last-child {
                border-bottom: unset;
            }

        .contact-activity {
            display: flex;
            align-items: center;
            column-gap: 14px;
        }

            .contact-activity img {
                max-width: 45px;
                aspect-ratio: 1/1;
                border-radius: 50%;
                object-fit: cover;
            }

            .contact-activity p {
                font-size: 0.9rem;
                line-height: 1.5;
                padding-right: 10px;
            }

                .contact-activity p span {
                    font-weight: 700;
                    color: var(--accent-color);
                    margin-left: 2px;
                    cursor: pointer;
                }

                    .contact-activity p span:hover {
                        text-decoration: underline;
                        text-decoration-color: var(--accent-color);
                        text-decoration-thickness: 1.5px;
                    }

        .contact-status small {
            font-size: 0.8rem;
            opacity: 0.5;
            margin-left: auto;
        }

        /* SCROLLBAR STYLE */

        .left-content::-webkit-scrollbar,
        .right-content::-webkit-scrollbar,
        body::-webkit-scrollbar {
            width: 8px;
        }

        .left-content::-webkit-scrollbar-track,
        .right-content::-webkit-scrollbar-track,
        body::-webkit-scrollbar-track {
            border-radius: 0;
        }

        .left-content::-webkit-scrollbar-thumb,
        .right-content::-webkit-scrollbar-thumb,
        body::-webkit-scrollbar-thumb {
            background-color: var(--scrollbar-color);
            border-radius: 40px;
        }

        /* MEDIA QUERIES */

        @media (max-width: 1500px) {
            .main-menu {
                width: 100px;
            }

            .user-info img {
                padding: 12px;
            }

            .user-info p {
                line-height: 1.1;
                margin: -5px 0 30px;
            }

            .nav-icon {
                text-align: center;
                transform: translateY(2px);
            }

            .nav-text {
                display: none;
            }

            .content {
                left: 100px;
                grid-template-columns: 70% 30%;
            }
        }

        @media (max-width: 1120px) {
            .content {
                grid-template-columns: 65% 35%;
            }

            .event-number i {
                font-size: 2.2rem;
            }
        }

        @media (max-width: 1120px) {
            .search-box input {
                width: 100%;
            }

            .search-box i {
                right: 2%;
            }
        }

        @media (max-width: 980px) {
            .content {
                grid-template-columns: 60% 40%;
            }

            .header-mobile,
            .header-desktop {
                display: none;
            }

            .header-tablet {
                display: block;
            }

            .chart {
                padding: 20px 10px;
            }
        }

        @media (max-width: 840px) {
            .content {
                grid-template-columns: 55% 45%;
            }

            .event-number i {
                font-size: 2rem;
            }
        }

        @media (max-width: 825px) {
            .left-content {
                padding: 25px 20px 20px;
            }

            .review-container {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            }
        }

        @media (max-width: 760px) {
            body {
                overflow: auto;
            }

            .main-menu {
                width: 70px;
            }

            .user-info img {
                max-width: 80px;
            }

            .user-info p {
                line-height: 1.1;
                margin: -10px 0 30px;
            }

            .nav-item a {
                padding: 8px 0;
            }

            .content {
                left: 70px;
                grid-template-columns: 100%;
                grid-template-areas: "leftContent" "rightContent";
                overflow: auto;
            }

            .left-content {
                grid-area: leftContent;
                height: auto;
                overflow: unset;
            }

            .header-mobile,
            .header-tablet {
                display: none;
            }

            .header-desktop {
                display: block;
            }

            .review-container {
                grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            }

            .right-content {
                grid-area: rightContent;
                border-left: unset;
                height: auto;
                overflow: unset;
            }

            .chart {
                width: 50%;
                margin: 20px auto;
            }

            .search-and-check {
                display: flex;
                align-items: center;
                gap: 40px;
                margin-bottom: 20px;
            }

            .search-box {
                flex-grow: 1;
            }

            .interaction-control {
                display: none;
            }

            .interaction-control-mobile {
                display: inline-flex;
            }

            .interactions {
                gap: 15px;
            }
        }

        @media (max-width: 650px) {
            .chart {
                width: 65%;
            }
        }

        @media (max-width: 610px) {
            .header-mobile,
            .header-desktop {
                display: none;
            }

            .header-tablet {
                display: block;
            }
        }

        @media (max-width: 550px) {
            .user-info {
                padding: 3px;
            }

            .header img {
                aspect-ratio: 4/2;
                height: 100%;
            }

            .chart {
                width: 80%;
            }

            .search-and-check {
                gap: 20px;
            }

            .interactions {
                gap: 10px;
            }

                .interactions i {
                    font-size: 1.1rem;
                }

            .mode-icon i {
                font-size: 1.4rem;
            }
        }

        @media (max-width: 450px) {
            .header-tablet,
            .header-desktop {
                display: none;
            }

            .header-mobile {
                display: block;
            }

            .bx-heart,
            .bxs-heart {
                font-size: 1.2rem;
            }

            .review-container {
                gap: 20px;
            }

            .search-box input {
                height: 30px;
                font-size: 0.8rem;
                padding: 8px 30px 8px 10px;
            }

            .search-box i {
                top: 20%;
                font-size: 1.1rem;
            }
        }

        @media (max-width: 400px) {
            .main-menu {
                width: 60px;
            }

            .user-info {
                padding: 0;
            }

            .nav-icon {
                font-size: 0.9rem;
            }

            .content {
                left: 60px;
            }

            .review-container {
                grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            }

            .chart {
                width: 100%;
            }
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%--<div class="cards-row">
        <div class="card">
            <img src='https://getmdl.io/assets/demos/welcome_card.jpg' class="card-image" id="img1" runat="server"/>
            <div class="card-title">
                This is title.
            </div>
            <div class="card-desc" id="div1" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus iusto s deleniti ea atque. Nostrum odio temporibus nisi inventore, velit hic in quas quos quo?
            </div>
            <div class="card-actions">
                <button type='button' class='card-action-readMore'>Read More</button>
            </div>
        </div>

        <div class="card">
            <img src='https://getmdl.io/assets/demos/welcome_card.jpg' class="card-image" id="img2" runat="server"/>
            <div class="card-title">
                This is title.
            </div>
            <div class="card-desc" id="div2" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus iusto sit, aperiam officia laborum labore voluptatibus deleniti ea atque. Nostrum odio temporibus nisi inventore, velit hic in quas quos quo?
            </div>
            <div class="card-actions">
                <button type='button' class='card-action-readMore'>Read More</button>
            </div>
        </div>
        <div class="card">
            <img src='https://getmdl.io/assets/demos/welcome_card.jpg' class="card-image" id="img3" runat="server"/>
            <div class="card-title">
                This is title.
            </div>
            <div class="card-desc" id="div3" runat="server">
                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus iusto sit, aperiam officia laborum labore voluptatibus deleniti ea atque. Nostrum odio temporibus nisi inventore, velit hic in quas quos quo?
            </div>
            <div class="card-actions">
                <button type='button' class='card-action-readMore'>Read More</button>
            </div>
        </div>
    </div>--%>


    <section class="content" style="margin-top: 0px; bottom: 0px; padding-bottom: 0px; padding-top: 0px; left: 0px;">
        <div class="left-content" style="padding-top: 0px; padding-bottom: 0px;">
            <div class="search-and-check">

            <%--    <div class="interaction-control-mobile interactions">
                    <i class="fa-regular fa-envelope notified"></i>
                    <i class="fa-regular fa-bell notified"></i>
                    <div class="toggle" onclick="switchTheme()">
                        <div class="mode-icon moon">
                            <i class="bx bxs-moon"></i>
                        </div>
                        <div class="mode-icon sun hidden">
                            <i class="bx bxs-sun"></i>
                        </div>
                    </div>
                </div>--%>
            </div>
            <div class="upcoming-events">
                <h1>New Users</h1>
                <div class="event-container">
                    <div class="card event-card">
                        <div class="event-header">
                            <asp:Image ID="imgNGO" runat="server" />
                            <p id="pNDate" runat="server"></p>
                            <i class="bx bx-heart like-btn"></i>
                        </div>
                        <div class="event-content">
                            <h2 id="hNGO" runat="server"></h2>
                            <p id="pNGO" runat="server"></p>
                        </div>
                        <div class="event-footer">
                            <div class="btn-group">
                                 <button onclick="window.open('ViewNGO.aspx');">Approve pending NGO's</button>                                
                            </div>
                        </div>
                    </div>

                    <div class="card event-card">
                        <div class="event-header">
                            <asp:Image ID="imgDonor" runat="server" />
                            <p id="pDDate" runat="server"></p>
                            <i class="bx bxs-heart like-btn"></i>
                        </div>
                        <div class="event-content">
                            <h2 id="hDonor" runat="server"></h2>
                            <p id="pDonor" runat="server"></p>
                            
                        </div>
                        <div class="event-footer">
                           
                            <div class="btn-group">
                                <button onclick="window.open('ViewDonor.aspx');">Approve pending Donors</button>
                            </div>
                        </div>
                    </div>

                    <div class="card event-card">
                        <div class="event-header">
                            <asp:Image ID="imgFundRaiser" runat="server" />
                            <p id="pFDate" runat="server"></p>
                            <i class="bx bx-heart like-btn"></i>
                        </div>
                        <div class="event-content">
                            <h2 id="hFund" runat="server"></h2>
                            <p id="pFund" runat="server"></p>
                        </div>
                        <div class="event-footer">

                            <div class="btn-group">
                                <button onclick="window.open('ViewFundRaiser.aspx');">Approve pending FundRaisers</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
        <div class="right-content">
            <div class="interaction-control interactions">
                <i class="fa-regular fa-envelope notified"></i>
                <i class="fa-regular fa-bell notified"></i>
                <div class="toggle" onclick="switchTheme()">
                    <div class="mode-icon moon">
                        <i class="bx bxs-moon"></i>
                    </div>
                    <div class="mode-icon sun hidden">
                        <i class="bx bxs-sun"></i>
                    </div>
                </div>
            </div>

            <div class="analytics">
                <h1>Analytics</h1>
                <div class="analytics-container">
                    <div class="total-events">
                        <div class="event-number card">
                            <h2>Top Donors</h2>
                            <p id="donorCount" runat="server"></p>
                            <i class="bx bx-check-circle"></i>
                        </div>
                        <div class="event-number card">
                            <h2>Top NGO</h2>
                            <p id="ngoCount" runat="server"></p>
                            <i class="bx bx-timer"></i>
                        </div>
                        <div class="event-number card">
                            <h2>Top Fundraiser</h2>
                            <p id="fundRaiserCount" runat="server"></p>
                            <i class="bx bx-timer"></i>
                        </div>
                    </div>

                    <%-- <div class="chart" id="doughnut-chart">
                      
                    </div>--%>
                </div>
            </div>

            <%--<div class="contacts">
                <h1>Contact of Users</h1>
                <div class="contacts-container">
                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/e56800db-687d-4d0e-a470-51e37a4431c7" alt="" />
                            <p>Matt favored <span>Jazz Fusion Night</span></p>
                        </div>
                        <small>1 hour ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/fac9f27b-c1ea-4bba-973f-88996322fa2d" alt="" />
                            <p>
                                Bella bought a ticket for
                <span>Acoustic Serenade Under the Stars</span>
                            </p>
                        </div>
                        <small>4 hours ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/1499d73c-ccc0-41a1-b530-1d629012aebd" alt="" />
                            <p>
                                Lucas bought a ticket for
                <span>Wimbledon Championships - 2024</span>
                            </p>
                        </div>
                        <small>1 day ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/949768d4-0196-486c-b386-edb47ddd54c2" alt="" />
                            <p>
                                Sophia favored
                <span>Clay Sculpting Class</span>
                            </p>
                        </div>
                        <small>1 day ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/8a470b8b-b5cf-4189-b36e-f22551997ff4" alt="" />
                            <p>
                                Kate bought a ticket for
                <span>Latin Rhythms Fusion</span>
                            </p>
                        </div>
                        <small>3 day ago</small>
                    </div>

                    <div class="contact-status">
                        <div class="contact-activity">
                            <img src="https://github.com/ecemgo/mini-samples-great-tricks/assets/13468728/7740acc0-3f86-4c28-8a8c-5ae67c343edb" alt="" />
                            <p>
                                Ben favored
                <span>Harry Potter Film Concert Series</span>
                            </p>
                        </div>
                        <small>6 day ago</small>
                    </div>
                </div>
            </div>--%>
        </div>

    </section>
</asp:Content>




