<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html>
<head>
    <title>결재 수정</title>
    <!-- 파비콘 -->
    <link rel="icon" href="/img/header/logo.png" type="image/png">

    <link rel="stylesheet" href="/css/document/write.css">
    <script defer src="/js/document/edit.js"></script>

    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/themes/default/style.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <script defer src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.min.js"></script>

    <link href="/css/template/summernote/summernote-lite.css" rel="stylesheet">
    <script defer src="/js/template/summernote/summernote-lite.js"></script>
    <script defer src="/js/template/summernote/summernote-ko-KR.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.3.12/jstree.checkbox.min.js"></script>
</head>
<body onload="editDocument(${param.docNo})">
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<%@ include file="/WEB-INF/views/document/aside.jsp" %>

<main id="content">
    <h1>결재수정</h1>
    <form id="documentForm" method="post" action="/orca/document/edit">
        <input type="hidden" name="docNo" value="${param.docNo}">
        <table class="document-table">
            <tr>
                <th>결재 프로세스</th>
                <td>
                    <select id="categoryNo" name="categoryNo" onChange="fetchTemplatesByCategory(this.value)">
                    <!-- 카테고리 옵션 -->
                    </select>
                </td>
                <th rowspan="2">긴급 여부</th>
                <td rowspan="2">
                    <label><input type="radio" name="urgent" value="Y"> 예</label>
                    <label><input type="radio" name="urgent" value="N" checked> 아니오</label>
                </td>
            </tr>
            <tr>
                <th>결재 양식</th>
                <td>
                    <select id="templateNo" name="templateNo">
                        <!-- 결재 양식 옵션 -->
                    </select>
                </td>
            </tr>
            <tr>
                <th>결재선</th>
                <td colspan='3'>
                    <div class="approval-process" name="approvalLineVoList">
                        <!-- 결재선 프로세스 -->
                    </div>
                    <button type="button" id="approvalEditBtn">수정</button>
                </td>
            </tr>
            <tr>
                <th>공람(참조인)</th>
                <td colspan="3">
                    <div id="referrerList">
                        <!-- 참조인 목록 -->
                    </div>
                    <button id="referrerAddBtn" type="button" onclick="openOrganizationModal()">추가</button>
                </td>
            </tr>
        </table>

        <table class="document-table">
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" name="title" id="title">
                </td>
            </tr>
            <tr>
                <th colspan='2'> 요청 내용 </th>
            </tr>
            <tr>
                <td colspan='2'>
                    <textarea id="summernote" name="content"></textarea>
                </td>
            </tr>
            <tr>
                <th>상태</th>
                <td>
                    <select name="status" id="status">
                        <option value="1">임시저장</option>
                        <option value="2">기안</option>
                    </select>
                </td>
            </tr>
        </table>
        <br>
        <br>
        <button type="submit" class="submit_btn">기안</button>
    </form>
</main>

<div id="organizationModal" class="addReferrerModal" hidden>
    <div class="modal-content">
        <span class="close" onclick="closeOrganizationModal()">X</span>
        <h2>참조인 추가</h2>
        <div id="jstree" class="jstree-container"></div>
        <button type="button" onclick="confirmSelection()">확인</button>
    </div>
</div>

</body>
</html>
