<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="card">
   <div class="card-header row" style="padding-right: 10px; height: 45px;">
      <h3 class="card-title col-4">개설강의 신청목록</h3>
      <div class="col-1"></div>
      <div class="col-7 curri-select-group row" style="padding-left: 40px;">
         <select class="form-control" id="class-type-select" style="width: 11%;">
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

         <select class="form-control" id="status-cd-select" style="width: 20%;">
            <option value="" ${pageMaker.status_cd eq '' ? 'selected' : ''}>처리상태</option>
            <option value="CCDR001" ${pageMaker.status_cd eq 'CCDR001' ? 'selected' : ''}>신청완료</option>
            <option value="CCDR002" ${pageMaker.status_cd eq 'CCDR002' ? 'selected' : ''}>반려</option>
            <option value="CCDR003" ${pageMaker.status_cd eq 'CCDR003' ? 'selected' : ''}>승인</option>
         </select>
         <div class="input-group input-group-sm mb-3" style="width: 50%;; height: 100%;">
            <input type="text" name="class-nm" class="form-control float-right" placeholder="교과목명을 입력하세요" style="height: 100%; width: 30%;">
            <div class="input-group-append" style="height: 100%;">
               <button type="submit" class="btn btn-primary btnBlue" onclick="registAcademicList();" style="border-radius: 0.2rem;">
                  <i class="fas fa-search" aria-hidden="true"></i>
               </button>
            </div>
         </div>
      </div>
   </div>
   <div class="card-body curriculum-list-card-body" style="padding-bottom: 30px;">
      <table class="table table-hover table-sm" style="font-size: 15px; text-align: center;">
         <thead>
            <tr style="height: 40px;">
               <th style="width: 10%">NO</th>
               <th style="width: 15%">학수번호</th>
               <th style="width: 30%">교과목명</th>
               <th style="width: 10">이수구분</th>
               <th style="width: 5%">학점</th>
               <th style="width: 20%">처리상태</th>
            </tr>
         </thead>
         <tbody id="curriculum-list-tbody">

         </tbody>
      </table>
   </div>
   <div class="card-footer curriculum-list-footer" style="height: 40px;"></div>
</div>
<div class="card">
   <div class="card-header row" style="padding: 5px 10px;">
      <h4 class="card-title col-6">개설 교육과정 상세보기</h4>
      <div class="btn-div col-6">
         <div style="float: right;">
            <button class="btn btnBlue btn-sm academic-btn" style="color: white; display: none;" onclick="updateStatusRegistCurriculu('CCDR003');">승인</button>
            <button class="btn btnRed btn-sm academic-btn" style="color: white; display: none;" onclick="updateStatusRegistCurriculu('CCDR002');">반려</button>
         </div>
      </div>
   </div>
   <div class="card-body" style="padding-bottom: 30px;">
      <div class="row div-group div-group-sm mb-3" style="margin: 10px 0 0 0;">
         <div class="col-1"></div>
         <div class="col-2">
            <label for="">학수번호</label>
            <div class="form-control" id="class-no"></div>
         </div>
         <div class="col-1">
            <label for="">이수구분</label>
            <div class="form-control" id="class-type"></div>
         </div>
         <div class="col-1">
            <label for="">학년</label>
            <div class="form-control" id="class-year"></div>
         </div>
         <div class="col-4">
            <label for="">교과목명</label>
            <div class="form-control" id="class-name"></div>
         </div>
         <div class="col-2">
            <label for="">지난학기 개설여부</label>
            <div class="form-control" id="before-open"></div>
         </div>

      </div>
      <div class="row" style="margin: 10px 0 0 0">
         <div class="col-1"></div>
         <div class="col-2">
            <label for="">개설 학과 코드</label>
            <div class="form-control" id="dept-cd"></div>
         </div>
         <div class="col-2">
            <label for="">개설 학과명</label>
            <div class="form-control" id="dept-nm"></div>
         </div>
         <div class="col-3">
            <label for="">신청 개설 학기</label>
            <div class="form-control" id="lecture-semester"></div>
         </div>
         <div class="col-2">
            <label for="">처리 상태</label>
            <div class="form-control" id="status-nm"></div>
         </div>
      </div>
   </div>
</div>
<div class="card-footer"></div>
