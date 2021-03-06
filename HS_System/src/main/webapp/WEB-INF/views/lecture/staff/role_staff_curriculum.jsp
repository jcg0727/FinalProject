<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card">
   <div class="card-header row" style="padding-right: 0px; height: 45px;">
      <h3 class="card-title col-4">교육과정 목록</h3>
      <div class="col-8 curri-select-group row" style="padding-left: 40px;">
         <select class="form-control" id="grade-select" style="width: 15%;">
            <option value="" ${pageMaker.grade eq '' ? 'selected' : ''}>학년</option>
            <option value="1" ${pageMaker.grade eq '1' ? 'selected' : ''}>1학년</option>
            <option value="2" ${pageMaker.grade eq '2' ? 'selected' : ''}>2학년</option>
            <option value="3" ${pageMaker.grade eq '3' ? 'selected' : ''}>3학년</option>
            <option value="4" ${pageMaker.grade eq '4' ? 'selected' : ''}>4학년</option>
         </select>

         <select class="form-control" id="class-type-select" style="width: 10%;">
            <option value="" ${pageMaker.class_type_cd eq '' ? 'selected' : ''}>구분</option>
            <option value="CCDO001" ${pageMaker.class_type_cd eq 'CCDO001' ? 'selected' : ''}>전필</option>
            <option value="CCDO002" ${pageMaker.class_type_cd eq 'CCDO002' ? 'selected' : ''}>전선</option>
            <option value="CCDO003" ${pageMaker.class_type_cd eq 'CCDO003' ? 'selected' : ''}>교필</option>
            <option value="CCDO004" ${pageMaker.class_type_cd eq 'CCDO004' ? 'selected' : ''}>교선</option>
         </select>

         <select class="form-control" id="score-type-select" style="width: 10%;">
            <option value="" ${pageMaker.class_score eq '' ? 'selected' : ''}>학점</option>
            <option value="1" ${pageMaker.class_score eq '1' ? 'selected' : ''}>1</option>
            <option value="2" ${pageMaker.class_score eq '2' ? 'selected' : ''}>2</option>
            <option value="3" ${pageMaker.class_score eq '3' ? 'selected' : ''}>3</option>
            <option value="4" ${pageMaker.class_score eq '4' ? 'selected' : ''}>4</option>
         </select>

         <div class="input-group input-group-sm mb-3" style="width: 60%; height: 100%;">
            <input type="text" name="class-nm" class="form-control float-right" placeholder="교과목명을 입력하세요" style="height: 100%; width: 30%;">
            <div class="input-group-append" style="height: 100%;">
               <button type="submit" class="btn btnBlue text-white" onclick="curriculumList();" style="border-radius: 0.2rem;">
                  <i class="fas fa-search" aria-hidden="true"></i>
               </button>
            </div>
            <button style="margin-left: 20px; color: white; height: 100%;" class="btn btnBlue btn-sm" onclick="registCurriculumOpen();">개설 신청</button>
         </div>
      </div>
   </div>
   <div class="card-body curriculum-list-card-body">
      <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
         <thead>
            <tr style="height: 40px;">
               <th style="width: 84.6px;">미개설신청</th>
               <th style="width: 40px;">NO</th>
               <th style="width: 300px;">교과목명</th>
               <th style="width: 200px;">학과명</th>
               <th style="width: 70;">학년</th>
               <th style="width: 100;">학수번호</th>
               <th style="width: 80px;">이수구분</th>
               <th style="width: 50px;">학점</th>
            </tr>
         </thead>
         <tbody id="curriculum-list-tbody">

         </tbody>
      </table>
   </div>
   <div class="card-footer curriculum-list-footer"></div>
</div>
<div class="row" style="width: 100%; margin: 5px 0">
   <div class="card col-6">
      <div class="card-header row" style="padding-right: 0;">
         <h3 class="card-title col-6">미개설 교육과정 목록</h3>
         <div class="input-group-sm col-6" style="float: right; padding-left: 10px;">
            <input type="text" name="table_search" id="upopenedSearch" class="form-control float-left" placeholder="교과목명을 입력하세요" style="width: 80%;">
            <div class="input-group-append">
               <button type="submit" class="btn btnBlue" onclick="unopenedCurriculumList();">
                  <i class="fas fa-search" aria-hidden="true" style="color: white;"></i>
               </button>
            </div>
         </div>
      </div>
      <div class="card-body sub-card-body">
         <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
            <thead>
               <tr style="height: 40px;">
                  <th>NO</th>
                  <th>학수번호</th>
                  <th class="class-name">교과목명</th>
                  <th>취소</th>
               </tr>
            </thead>
            <tbody id="unopened-list-tbody">
            </tbody>
         </table>
      </div>
      <div class="card-footer unopened-list-footer"></div>
   </div>
   <div class="card col-6"  id="open-curriculum-regist-list">
      <div class="card-header row" style="padding-right: 0;">
         <h3 class="card-title col-4">개설 신청 목록</h3>
         <div class="col-8 row" style="float: right;">
            <select class="form-control" id="status-select" style="height: 30px; width: 35%;">
               <option value="">상태</option>
               <option value="CCDR001">신청완료</option>
               <option value="CCDR002">승인</option>
               <option value="CCDR003">반려</option>
            </select>
            <div class="input-group-sm" style="width: 60%;">
               <input style="width: 85%; padding: 5px 5px;" type="text" name="opened-search" id="opened-search" class="form-control float-left" placeholder="교과목명을 입력하세요">
               <div class="input-group-append">
                  <button type="button" class="btn btnBlue" onclick="registCurriculumList();">
                     <i class="fas fa-search" aria-hidden="true" style="color: white;"></i>
                  </button>
               </div>
            </div>
         </div>
      </div>
      <div class="card-body sub-card-body">
         <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
            <thead>
               <tr style="height: 40px;">
                  <th>NO</th>
                  <th>학수번호</th>
                  <th class="class-name">교과목명</th>
                  <th>상태</th>
               </tr>
            </thead>
            <tbody id="regist-list-tbody">
            </tbody>
         </table>
      </div>
      <div class="card-footer regist-list-footer"></div>
   </div>
</div>