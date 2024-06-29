<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>결재선 등록</title>
    <link rel="icon" href="/img/logo.png" type="image/png">
    <link rel="stylesheet" href="/css/approvalLine/list.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
</head>
<body>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/document/aside.jsp" %>

<main id="content">
    <form id="approvalLineForm" action="/orca/apprline/add" method="post">
        <label for="apprLineName">결재선 이름:</label>
        <input type="text" id="apprLineName" name="apprLineName">

        <label for="categoryNo">카테고리:</label>
        <select id="categoryNo" name="categoryNo" onChange="fetchTemplatesByCategory(this.value)">
            <!-- 카테고리 옵션들이 여기 추가될 예정 -->
        </select>

        <label for="templateNo">템플릿:</label>
        <select id="templateNo" name="templateNo">
            <!-- 템플릿 옵션들이 여기 추가될 예정 -->
        </select>

        <div id="approvers">
            <!-- 결재자 입력 필드들이 추가될 곳 -->
        </div>

        <button type="button" onclick="addApprover()">결재자 추가</button>
        <button type="submit">등록</button>

        <div id="jstree">
            <!-- 트리 구조를 여기에 삽입 -->
        </div>
    </form>
</main>

<script>
    let approverCount = 0;

           function addApprover() {
               const approversDiv = document.getElementById('approvers');
               const approverDiv = document.createElement('div');
               approverDiv.classList.add('approver');

               // HTML을 문자열로 직접 구성
               const html = `
                   <div>
                       <label for="approverNo` + approverCount + `">결재자 번호:</label>
                       <input type="number" id="approverNo` + approverCount + `" name="approverVoList[` + approverCount + `].approverNo">

                       <label for="seq` + approverCount + `">순서:</label>
                       <input type="number" id="seq` + approverCount + `" name="approverVoList[` + approverCount + `].seq" value="` + (approverCount + 1) + `" readonly>

                       <label>결재자 분류 번호:</label>
                       <label>
                           <input type="radio" id="approverClassificationNo` + approverCount + `_1" name="approverVoList[` + approverCount + `].approverClassificationNo" value="1"> 결재자
                       </label>
                       <label>
                           <input type="radio" id="approverClassificationNo` + approverCount + `_2" name="approverVoList[` + approverCount + `].approverClassificationNo" value="2"> 합의자
                       </label>
                   </div>
               `;

               approverDiv.innerHTML = html;
               approversDiv.appendChild(approverDiv);
               approverCount++;  // 증가
           }


        // 결재양식add 화면 - 카테고리 번호 가져가서 템플릿 제목 가져오기
        function fetchTemplatesByCategory(categoryNo) {
            $.ajax({
                url: '/orca/apprline/template/list',
                method: 'GET',
                data: { categoryNo: categoryNo },
                success: function(templates) {
                    const templateSelect = document.querySelector('#templateNo');
                    templateSelect.innerHTML = '';
                    templates.forEach(template => {
                        const option = document.createElement('option');
                        option.value = template.templateNo;
                        option.text = template.title;
                        templateSelect.appendChild(option);
                    });
                },
                error: function(error) {
                    console.error('Error fetching templates:', error);
                }
            });
        }

        // 결재양식add 화면 - 선택한 카테고리 번호 가져오기
        function fetchCategories() {
            $.ajax({
                url: '/orca/apprline/categorie/list',
                method: 'GET',
                success: function(categories) {
                    const categorySelect = document.querySelector('#categoryNo');
                    categorySelect.innerHTML = '';

                    categories.forEach(category => {
                        const option = document.createElement('option');
                        option.value = category.categoryNo;
                        option.text = category.categoryName;
                        categorySelect.appendChild(option);
                    });

                    // 첫 번째 카테고리를 선택하고 템플릿을 로드합니다.
                    if (categories.length > 0) {
                        fetchTemplatesByCategory(categories[0].categoryNo);
                    }
                },
                error: function(error) {
                    console.error('Error fetching categories:', error);
                    console.log(error); // 에러 객체를 로그에 출력
                }
            });
        }

        // 결재양식add 화면 - 조직도 가져오기
        function fetchOrganization() {
            $('#jstree').jstree({
                'core' : {
                    'data' : {
                        'url' : '/orca/apprline/organization/list',
                        'dataType' : 'json'
                    }
                }
            });
        }

        $(function() {
            // 페이지 로드 후 카테고리와 조직도 로드
            fetchCategories();
            fetchOrganization();
        });
</script>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>

</body>
</html>
