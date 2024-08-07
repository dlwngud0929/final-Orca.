<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="UTF-8">
            <title>Home</title>
            <!-- 파비콘 -->

            <script defer src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <link rel="stylesheet" href="/css/layout/main.css">

            <script defer src="/js/layout/main.js"></script>

        </head>

        <body>

            <%@ include file="/WEB-INF/views/layout/header.jsp" %>
                <%@ include file="/WEB-INF/views/layout/aside.jsp" %>

                    <main id="content">
                        <div class="content-header">
                            <h2>출근시간</h2>
                            <h2>ORCA</h2>
                        </div>
                        <div class="dashboard">
                            <div class="dashboard-row">
                                <div class="dashboard-col-lg">
                                    <div class="work-status">
                                        <div class="section-header">
                                            <span>출·퇴근</span>
                                            <button class="refresh-button">⟳</button>
                                        </div>

                                        <div class="work-status-inner">
                                            <div>
                                                <p id="date"></p>
                                                <p id="accumulatedWorkTime"></p>
                                                <p id="actualWorkTime"></p>
                                            </div>
                                            <div id="clock" class="clock"></div>
                                        </div>

                                        <div class="work-time">
                                            <div class="time-display">
                                                <div>
                                                    <span class="time-icon" id="startWork" onclick="startWorkClick();">⏰출근시간</span>
                                                    <p class="time" id="sWorkTime">--:--</p>
                                                </div>
                                                <div>
                                                    <span class="time-icon" id="endWork" onclick="endWorkClick();">⏱퇴근시간</span>
                                                    <p class="time" id="eWorkTime">--:--</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="dashboard-col-sm">
                                    <div class="main-div">
                                        <div class="section-header">
                                            <span>캘린더/할일</span>
                                            <button class="refresh-button">⟳</button>
                                        </div>
                                        <div class="calendar-sell">
                                            <div class="meal-table" id="calendar">

                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="dashboard-row">

                                <div class="dashboard-col-sm">
                                    <div class="main-div">
                                        <div class="section-header">
                                            <span>전자결재</span>
                                            <button class="refresh-button" onclick="fetchDocuments()">⟳</button>
                                        </div>
                                        <div id="document-list">
                                            <!-- AJAX로 가져온 결재 문서 -->
                                        </div>
                                    </div>
                                </div>

                                <div class="dashboard-col-sm">
                                    <div class="main-div">
                                        <div class="section-header">
                                            <span>식단표</span>
                                            <button class="refresh-button">⟳</button>
                                        </div>
                                        식단표
                                    </div>
                                </div>
                                <div class="dashboard-col-sm">
                                    <div class="main-div">
                                        <div class="section-header">
                                            <span>공지사항</span>
                                            <button class="refresh-button">⟳</button>
                                        </div>
                                        공지사항
                                    </div>
                                </div>
                            </div>
                        </div>
                    </main>

        </body>

        </html>