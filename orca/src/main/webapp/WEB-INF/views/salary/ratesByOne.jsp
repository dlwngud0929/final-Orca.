<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ page contentType="text/html;charset=UTF-8" language="java" %>
        <%@ page import="com.groupware.orca.user.vo.UserVo" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8">
                <title>salary retesList</title>
                <!-- 파비콘 -->
                <link rel="icon" href="img/logo.png" type="image/png">
                <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
                <link rel="stylesheet"
                    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

                <!-- my css -->
                <link rel="stylesheet" href="/css/salary/ratesByOne.css">

                 <!-- 공용 css -->
                <link rel="stylesheet" href="/css/layout/aside.css">
                <script defer src="/js/layout/aside.js"></script>
                
                <link rel="icon" href="/img/logo.png" type="image/png">
                <link rel="stylesheet" href="/css/layout/header.css">
                <script defer src="/js/layout/header.js"></script>
            </head>

            <body>
                <% UserVo loginUserVo=(UserVo) session.getAttribute("loginUserVo"); String
                    imgChangeName=(loginUserVo.getImgChangeName() !=null) ? loginUserVo.getImgChangeName()
                    : "profile.png" ; %>

                    <header>
                        <div class="header-left">
                            <a href="/orca/home"><img src="/img/header/logo.png" alt="Logo" class="logo"></a>
                            <a href="/orca/home" style="text-decoration: none; color:black;">
                                <h2>ORCA</h2>
                            </a>
                        </div>
                        <div class="header-right">
                            <span class="icon"><img src="/img/header/bell.png" alt="bell" class="icon"></span>
                            <span class="icon"><img src="/img/header/organization-chart.png" alt="organization-chart"
                                    class="icon organizationChart"></span>
                            <span class="icon"><img src="/img/header/settings.png" alt="settings" class="icon"></span>
                        </div>
                    </header>

                    <button id="toggleSidebar" class="sidebar-toggle" onclick="toggleSidebar()">메뉴</button>
                    <aside id="sidebar" class="sidebar">

                        <div class="profile" onclick="toggleProfile()">

                            <img src="/upload/user/<%= imgChangeName %>" alt="Profile Picture" class="profile-pic">

                            <p class="profile-info">
                                <%= loginUserVo.getTeamName() %> | <span>
                                        <%= loginUserVo.getName() %>
                                    </span>
                            </p>
                        </div>
                        <hr>


                        <div id="profileDetail" class="profile-detail hidden">

                            <div id="empNo"></div>
                            <div id="partName"></div>
                            <div id="position"></div>
                            <div id="phone"></div>
                            <div id="extensionCall"></div>
                            <div id="email"></div>
                            <div id="change-password">비밀번호 변경</div>
                            <button onclick="logout()">로그아웃</button>
                        </div>

                        


                        <!-- <div class="profile" onclick="toggleProfile()">
                                <img src="profile.png" alt="Profile Picture" class="profile-pic">
                                <p class="profile-info">회계 1팀 | <span>양파쿵야</span></p>
                            </div>
                            <hr> -->
                        <nav>
                            <div class="sidebar-nav">
                                <div class="approval title-toggle">◾ 급여 관리</div>
                                <div class="approval-list">
                                    <div class="toggle"><a href="/orca/salaryWrite">◽ 급여 입력</a></div>
                                    <div class="toggle"><a href="/orca/salaryList">◽ 급여 목록</a></div>
                                </div>
                                <div class="calnedar title-toggle">◾ 4대보험</div>
                                <div class="calendar-link link">
                                    <div class="calendar-wirte toggle"><a href="/orca/ratesByOne">◽ 조회 - 수정</a>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </aside>
                    <main>
                        <div class="main" id="content">
                            <h1>4대 보험 요율 조회</h1>

                            <div id="ratesByOne">

                            </div>

                            <div id="editRates">
                                <form id="editRatesForm">
                                    글 번호: <input type="text" name="ratesNo" id="ratesNo" readonly><br>
                                    국민연금: <input type="text" name="pensionPercentage" id="pensionPercentage"><br>
                                    건강보험: <input type="text" name="healthInsurancePercentage"
                                        id="healthInsurancePercentage"><br>
                                    장기요양보험: <input type="text" name="longCarePercentage" id="longCarePercentage"><br>
                                    고용보험: <input type="text" name="employmentInsurancePercentage"
                                        id="employmentInsurancePercentage"><br>
                                    지방소득세: <input type="text" name="localIncomeTaxPersentage"
                                        id="localIncomeTaxPersentage"><br>
                                    <input type="submit" value="수정하기">
                                </form>
                            </div>



                        </div>
                    </main>
            </body>

            </html>

            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

            <script>
                ratesByOne();
                function ratesByOne() {
                    $.ajax({

                        url: "http://127.0.0.1:8080/orca/salary/ratesByOne",
                        method: "GET",
                        success: function (data) {
                            console.log(data);


                            const ratesList = document.querySelector("#ratesByOne");
                            let str = "";

                            str += "<div>";
                            str += "<h3>글 번호 : " + data.ratesNo + "</h3>";
                            str += "<h3>기준연도 : " + data.baseYear + "</h3>";
                            str += "<h3>국민연금 : " + data.pensionPercentage + "</h3>";
                            str += "<h3>건강보험 : " + data.healthInsurancePercentage + "</h3>";
                            str += "<h3>장기요양보험 : " + data.longCarePercentage + "</h3>";
                            str += "<h3>고용보험 : " + data.employmentInsurancePercentage + "</h3>";
                            str += "<h3>지방 소득세 : " + data.localIncomeTaxPersentage + "</h3>";
                            str += "<button onclick='edit(" + data.ratesNo + ");'>수정 하기</button>";
                            str += "</div>";

                            console.log(data);

                            $("#editRates").hide();
                            ratesList.innerHTML = str;
                            document.querySelector("#editRates input[name='ratesNo']").value = data.ratesNo;
                            document.querySelector("#editRates input[name='pensionPercentage']").value = data.pensionPercentage;
                            document.querySelector("#editRates input[name='healthInsurancePercentage']").value = data.healthInsurancePercentage;
                            document.querySelector("#editRates input[name='longCarePercentage']").value = data.longCarePercentage;
                            document.querySelector("#editRates input[name='employmentInsurancePercentage']").value = data.employmentInsurancePercentage;
                            document.querySelector("#editRates input[name='localIncomeTaxPersentage']").value = data.localIncomeTaxPersentage;

                            console.log();

                        }
                    });
                }

            </script>

            <script>
                function edit(ratesNo) {
                    $('#ratesByOne').hide();
                    $("#editRates").show();

                    $(document).ready(function () {
                        $('#editRatesForm').on('submit', function (e) {
                            e.preventDefault();
                            var ratesNo = $('#ratesNo').val();
                            var pensionPercentage = $('#pensionPercentage').val();
                            var healthInsurancePercentage = $('#healthInsurancePercentage').val();
                            var longCarePercentage = $('#longCarePercentage').val();
                            var employmentInsurancePercentage = $('#employmentInsurancePercentage').val();
                            var localIncomeTaxPersentage = $('#localIncomeTaxPersentage').val();

                            console.log(ratesNo);
                            console.log(pensionPercentage);
                            console.log(healthInsurancePercentage);
                            console.log(longCarePercentage);
                            console.log(employmentInsurancePercentage);
                            console.log(localIncomeTaxPersentage);

                            $.ajax({
                                url: "http://127.0.0.1:8080/orca/salary/ratesEdit",
                                method: "post",
                                dataType: 'json',
                                data: {
                                    ratesNo: ratesNo,
                                    pensionPercentage: pensionPercentage,
                                    healthInsurancePercentage: healthInsurancePercentage,
                                    longCarePercentage: longCarePercentage,
                                    employmentInsurancePercentage: employmentInsurancePercentage,
                                    localIncomeTaxPersentage: localIncomeTaxPersentage
                                },
                                success: function (data) {
                                    if (data == 1) {
                                        alert("수정 성공하셨습니다.");
                                    } else {
                                        alert("수정 실패하셨습니다.")
                                    }
                                    $('#editRates').hide();
                                    $('#ratesByOne').show();
                                    ratesByOne();
                                },


                            });
                        });
                    });
                }

            </script>


            
