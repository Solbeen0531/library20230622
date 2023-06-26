<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8"/>
<meta id="_csrf" name="_csrf" th:content=""/>
<meta id="_csrf_header" name="_csrf_header" th:content=""/>
<meta property="og:type" content="website"/>
<meta property="og:title" content="경상북도교육청 울릉도서관"/>
<meta property="og:description" content="경상북도교육청 울릉도서관"/>
<meta property="og:url" content="http://www.gbelib.kr/ul/index.do"/>
<link rel="canonical" href="http://www.gbelib.kr/ul/index.do">
<meta name="description" content="경상북도교육청 울릉도서관">
<title>경상북도교육청 울릉도서관</title>
<!--[if IE]>
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<![endif]-->
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=0,maximum-scale=10"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/select2.min.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.mmenu.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/default_new_fullpage.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/login.css"/>
<link rel="stylesheet" type="text/css" href="/resources/board/css/default.css"/>
<link rel="stylesheet" type="text/css" href="/resources/book/css/common.css"/>
<link rel="stylesheet" type="text/css" href="/resources/homepage/ul/css/default_new.css"/>
<link rel="stylesheet" type="text/css" href="/resources/homepage/ul/css/main_new.css"/>
<link rel="stylesheet" type="text/css" href="/resources/common/css/main_curation_type2.css"/>
<!--[if lte IE 7]>
<link rel="stylesheet" type="text/css" href="/resources/common/css/fontawesome-ie7.min.css"/>
<![endif]-->
<!--[if lte IE 8]>
<link rel="stylesheet" type="text/css" href="/resources/homepage/ul/css/ie.css"/>
<![endif]-->
<script type="text/javascript" src="/resources/common/js/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery-ui-1.12.0-datepicker.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="/resources/common/js/jquery.mmenu.min.js"></script>
<script type="text/javascript" src="/resources/common/js/default.js"></script>
<script type="text/javascript" src="/resources/common/js/common.js"></script>
<script type="text/javascript" src="/resources/homepage/ul/js/common.js"></script>
<script type="text/javascript" src="/resources/common/js/kakao.min.js"></script>
<script type="text/javascript" src="/resources/homepage/ul/js/libindex.js"></script>
</head>
<body>

<a href="#container" class="skip-to">본문 바로가기</a>
<a href="#navi" class="skip-to">메뉴 바로가기</a><link rel="stylesheet" type="text/css" href="/resources/common/css/jquery.fullpage.css"/>
<script type="text/javascript" src="/resources/common/js/jquery.fullpage.js"></script>

<script type="text/javascript">
	$(function() {
		// 팝업 관련 코드 START
		$('.close-btn').on('click', function() {
			var $this = $(this);
			var checkInput = $this.parent().find('input');
			var popupId = checkInput.val();
			if ( checkInput.prop('checked') ) {
				var todayDate 	= new Date();   
				todayDate 		= new Date(parseInt(todayDate.getTime() / 86400000) * 86400000 + 54000000);  
				document.cookie = popupId + "=no" + "; path=/; expires=" + todayDate.toGMTString() + ";"	
			}
			
			$('div#'+popupId).hide();
		});
		
		$('input[id*=pop]').on('click', function(e) {
			e.preventDefault();
			$(this).prop('checked', true);
			$(this).parent('div').next('a').click();
		});
		
		$('#popupLayer > div').each(function(i, v) {
			var result = '';
			var name = $(v).attr('id');
			var nameOfCookie = name + "=";  
		    var x = 0;  
		    while ( x <= document.cookie.length ) {  
		       var y = ( x + nameOfCookie.length );
		       if ( document.cookie.substring( x, y ) == nameOfCookie ) {  
		           if ( (endOfCookie=document.cookie.indexOf( ";", y )) == -1 )  
		               endOfCookie = document.cookie.length;  
		           result = unescape( document.cookie.substring( y, endOfCookie ) );  
		       }  
		       x = document.cookie.indexOf( " ", x ) + 1;  
		       if ( x == 0 )  
		           break;  
		    }  
			
		   	if (result != 'no') {
		   		if  (window.innerWidth < $(v).width() ) {
					$(v).css('width', 'auto');
				}
		      	$(v).show();
		   	}
		});
	   	// 팝업 관련 코드 END
	   	
	   	$('#all-popup-wrap').each(function(i, v) {
			var result = '';
			var name = $(v).attr('class');
			var nameOfCookie = name + "=";
			var x = 0;
			while (x <= document.cookie.length) {
				var y = (x + nameOfCookie.length);
				if (document.cookie.substring(x, y) == nameOfCookie) {
					if ((endOfCookie = document.cookie
							.indexOf(";", y)) == -1)
						endOfCookie = document.cookie.length;
					result = unescape(document.cookie
							.substring(y, endOfCookie));
				}
				x = document.cookie.indexOf(" ", x) + 1;
				if (x == 0)
					break;
			}

			if (result != 'no') {
				if  (window.innerWidth < $(v).width() ) {
					$(v).css('width', 'auto');
				}
				$(v).show();
				$('#all-popup-wrap').load('popupAll.do', function() {
					//$(window).trigger('resize');
				});
			} else {
				$('#all-popup-wrap').empty;
			}
		});
	   	
		$('#main-search-btn').on('click', function() {
			if( $('input#search_text_1').val() == '' ) {
				alert('찾으시는 도서 정보를 입력하세요.');
				$('input#search_text_1').focus();
				return false;
			}
				$('#mainSearchForm').submit();
		});
	   	
		//doAjaxLoad('div.main2 div.newBook', 'newBook.do','startDate=2016-12-01');
		$('#calendar-box').load('calendar3.do', function() {
			//$(window).trigger('resize');
		});
	});
</script>
<div id="wrap">
	<script>
$(document).ready(function() {
	$('#popup_open').on('click',function(){
		var popup_count = '0';
		
		if (popup_count > 0) {
			$('#all-popup-wrap').empty;
			$('#all-popup-wrap').show();
			$('#all-popup-wrap').load('popupAll.do', function() {
			});
		} else {
			alert('등록된 팝업이 없습니다.');
			return false;
		}
	})
});
</script>
<div id="header">
	<nav id="menu"></nav>

	<div class="tnb">
		<div class="util-left">
			<ul>
				<li><a href="https://www.gbelib.kr/gbelib/index.do" target="_blank">통합공공도서관</a></li>
				<li><a href="https://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
			</ul>
		</div>
		<div class="util-right">
			<ul>
			<li><a href="https://www.gbelib.kr/ul/intro/login/index.do?menu_idx=121">로그인</a></li>
					<li><a href="https://www.gbelib.kr/ul/intro/join/index.do?menu_idx=120">회원가입</a></li>
					<li><a href="https://www.gbelib.kr/ul/module/myDashBoard/index.do?menu_idx=195" class='tnb-box-1'>나의도서관</a></li>
				<li><a href="#" class='tnb-box-2' id="popup_open">통합팝업열기 <span class="tot-popup-cnt">0</span></a></li>
				</ul>
		</div>
	</div>


<script>
$(document).ready(function() {
	$('a#memberInfoBtn').on('click', function(e) {
		$('div#member_layer').show();
		$('div.calAll').show();
		e.preventDefault();
	});
	$("a#memberInfoBtn").on('mouseover', function() {
		$('div#member_layer').show();
		$('div.calAll').show();
	});
	$("div#member_layer").on('mouseover', function() {
		$('div#member_layer').show();
		$('div.calAll').show();
	});
	$("div#member_layer").on('mouseout', function() {
		$('div#member_layer').hide();
		$('div.calAll').hide();
	});
	$('a#closeMemberInfo').on('click', function(e) {
		$('div#member_layer').hide();
	});
});
</script>
<div id="memberInfo">
	<div class="inbox" id="member_layer" style="display: none;">
		<div class="calAll" >
			<img class="boxnImg box1" id="loginIcon" src="/resources/common/img/login01.png" alt=""/>
			<div class="loginInfo">
				<div class="boxn box2_1">최근 로그인<br/> <span class="fontBlue"></span><br/></div>
				
				
				<div class="boxn box3_1">최근 접속 IP<br/> <span class="fontBlue"></span></div>
			</div>
			
			<div style="margin-top: -15px; text-align: center;"><img id="line" src="/resources/common/img/line01.png" style="width:96%;height: 6px;" alt="이미지 선모양" ></div> 
			 
			<div style="text-align: center;">
				<a href="https://www.gbelib.kr/ul/intro/join/modifyForm.do?menu_idx=113" class="btn">회원정보수정</a>
				<a href="https://www.gbelib.kr/ul/intro/join/reAgree.do?menu_idx=113" class="btn btnStyle">유지기간 연장</a>
			</div>
			
			<div class="memberCon" style="margin-top: 10px;">
				<div class="memberCon2">
					<strong>개인정보 재동의 기간</strong>: <span class="fontRed">~</span><br/><br/>
					<ol style="list-style-position: outside; list-style-type:disc; margin-left: 12px;">
						<li>회원자격 유지기간을 연장하려면 아래의 연장 버튼을 클릭하세요.</li>
					</ol>
					<br/>
				</div>
			</div>
		</div>
		<a href="#" id="closeMemberInfo" class="close"><i class="fa fa-close"></i></a>
	</div>
</div><div id="m-util" class="no3">
	<ul>
		<li><a href="https://www.gbelib.kr/gbelib/index.do" target="_blank">통합공공도서관</a></li>
		<li><a href="https://www.gbelib.kr/elib/index.do" target="_blank">전자도서관</a></li>
		<!--<li><a href="">모바일회원증</a></li>-->
	</ul>
</div>


<div class="head">
		<div class="Gnb">
			<h2 class="blind">주메뉴</h2>
			<div class="wide-sections">
				<h1><a href="http://www.gbelib.kr/ul/index.do"><img src="/resources/homepage/ul/img/logo.png" alt="경상북도교육청 울릉도서관"/></a></h1>
				<div class="mmode m-menu">
					<a href="#menu"><i class="fa fa-navicon"></i><span class="blind">메뉴</span></a>
				</div>
				<!-- <div class="mmode m-menu curation">
					<a href="http://q.gbelib.kr/index.jsp?gid=6" target="_blank" title="큐레이션으로 이동"><img src="/../resources/common/img/curation_btn_mobile.png" alt="큐레이션 이동"></a>
				</div> -->
				<!-- menu S -->
				<div class="g-menu">
					<ul class="gnb-menu">
<li class="List 1Depth menu1 menu_1"><a href="/ul/html.do?menu_idx=1" ><span>자료검색</span></a>
<ul class="SubMenu">
<li class="2Depth menu_7"><a href="/ul/html.do?menu_idx=7" ><span>소장자료</span></a>
<ul>
<li class="3Depth menu_8"><a href="/ul/intro/search/index.do?menu_idx=8" ><span>도서자료</span></a></li>
<li class="3Depth menu_10"><a href="/ul/html.do?menu_idx=10" ><span>연속간행물</span></a></li></ul></li>
<li class="2Depth menu_12"><a href="/ul/intro/search/newBook/index.do?menu_idx=12" ><span>신착자료</span></a></li>
<li class="2Depth menu_16"><a href="/ul/intro/search/hope/index.do?menu_idx=16" ><span>희망도서신청</span></a></li>
<li class="2Depth menu_13"><a href="/ul/html.do?menu_idx=13" ><span>추천도서</span></a>
<ul>
<li class="3Depth menu_21"><a href="/ul/board/index.do?menu_idx=21&manage_idx=529" ><span>사서추천</span></a></li>
<li class="3Depth menu_28"><a href="http://bookfriend.info.go.kr/root/index.do" target="_blank"><span>경북독서친구</span></a></li></ul></li>
<li class="2Depth menu_206"><a href="https://www.gbelib.kr/elib/index.do" target="_blank"><span>경상북도교육청 전자도서관</span></a></li>
<li class="2Depth menu_32"><a href="/ul/html.do?menu_idx=32" ><span>국가전자도서관</span></a></li></ul></li>
<li class="List 1Depth menu2 menu_2"><a href="/ul/html.do?menu_idx=2" ><span>독서문화행사</span></a>
<ul class="SubMenu">
<li class="2Depth menu_41"><a href="/ul/html.do?menu_idx=41" ><span>독서퀴즈</span></a></li>
<li class="2Depth menu_39"><a href="/ul/html.do?menu_idx=39" ><span>독서교실</span></a></li>
<li class="2Depth menu_42"><a href="/ul/html.do?menu_idx=42" ><span>원화전시</span></a></li>
<li class="2Depth menu_35"><a href="/ul/html.do?menu_idx=35" ><span>도서관주간</span></a></li>
<li class="2Depth menu_38"><a href="/ul/html.do?menu_idx=38" ><span>독서의달</span></a></li>
<li class="2Depth menu_207"><a href="/ul/html.do?menu_idx=207" ><span>어린이독서회</span></a></li>
<li class="2Depth menu_191"><a href="/ul/module/teach/index.do?menu_idx=191&searchCate1=16,17" ><span>온라인신청</span></a></li></ul></li>
<li class="List 1Depth menu3 menu_3"><a href="/ul/html.do?menu_idx=3" ><span>평생교육</span></a>
<ul class="SubMenu">
<li class="2Depth menu_164"><a href="/ul/html.do?menu_idx=164" ><span>연간운영계획</span></a></li>
<li class="2Depth menu_165"><a href="/ul/html.do?menu_idx=165" ><span>프로그램신청</span></a>
<ul>
<li class="3Depth menu_166"><a href="/ul/module/teach/index.do?menu_idx=166&searchCate1=18" ><span>전체</span></a></li>
<li class="3Depth menu_46"><a href="/ul/module/teach/index.do?menu_idx=46&searchCate1=18&searchAge=11" ><span>어린이 프로그램</span></a></li>
<li class="3Depth menu_48"><a href="/ul/module/teach/index.do?menu_idx=48&searchCate1=18&searchAge=13" ><span>성인 프로그램</span></a></li>
<li class="3Depth menu_50"><a href="/ul/module/teach/index.do?menu_idx=50&searchCate1=18&searchAge=19" ><span>부모&가족 프로그램</span></a></li></ul></li>
<li class="2Depth menu_61"><a href="/ul/html.do?menu_idx=61" ><span>재능기부/강사신청</span></a></li></ul></li>
<li class="List 1Depth menu4 menu_4"><a href="/ul/html.do?menu_idx=4" ><span>참여공간</span></a>
<ul class="SubMenu">
<li class="2Depth menu_58"><a href="/ul/board/index.do?menu_idx=58&manage_idx=528" ><span>공지사항</span></a></li>
<li class="2Depth menu_101"><a href="/ul/board/index.do?menu_idx=101&manage_idx=551" ><span>사진으로보는도서관</span></a></li>
<li class="2Depth menu_103"><a href="/ul/board/index.do?menu_idx=103&manage_idx=533" ><span>도서관뉴스</span></a></li>
<li class="2Depth menu_74"><a href="/ul/board/index.do?menu_idx=74&manage_idx=531" ><span>자주하는질문</span></a></li>
<li class="2Depth menu_68"><a href="/ul/board/index.do?menu_idx=68&manage_idx=532" ><span>도서관에 바란다</span></a></li>
<li class="2Depth menu_60"><a href="/ul/html.do?menu_idx=60" ><span>자원봉사신청</span></a></li>
<li class="2Depth menu_67"><a href="/ul/module/survey/index.do?menu_idx=67" ><span>설문조사</span></a></li>
<li class="2Depth menu_66"><a href="/ul/html.do?menu_idx=66" ><span>정보공개</span></a>
<ul>
<li class="3Depth menu_75"><a href="/ul/html.do?menu_idx=75" ><span>정보공개제도안내</span></a></li>
<li class="3Depth menu_77"><a href="https://www.open.go.kr/pa/main/listSearchSubMain.do" target="_blank"><span>정보공개목록</span></a></li>
<li class="3Depth menu_79"><a href="https://www.open.go.kr/pa/member/openLogin/memberLogin.do" target="_blank"><span>정보공개청구</span></a></li>
<li class="3Depth menu_82"><a href="/ul/board/index.do?menu_idx=82&manage_idx=530" ><span>정보공개자료실</span></a></li></ul></li>
<li class="2Depth menu_196"><a href="/ul/board/index.do?menu_idx=196&manage_idx=641" ><span>개인정보처리방침</span></a></li></ul></li>
<li class="List 1Depth menu5 menu_5"><a href="/ul/html.do?menu_idx=5" ><span>도서관서비스</span></a>
<ul class="SubMenu">
<li class="2Depth menu_83"><a href="/ul/html.do?menu_idx=83" ><span>이용안내</span></a>
<ul>
<li class="3Depth menu_90"><a href="/ul/html.do?menu_idx=90" ><span>이용시간</span></a></li>
<li class="3Depth menu_91"><a href="/ul/html.do?menu_idx=91" ><span>대출회원가입</span></a></li>
<li class="3Depth menu_170"><a href="/ul/html.do?menu_idx=170" ><span>자료실안내</span></a></li>
<li class="3Depth menu_93"><a href="/ul/html.do?menu_idx=93" ><span>자료이용</span></a></li>
<li class="3Depth menu_193"><a href="/ul/html.do?menu_idx=193" ><span>책이음서비스</span></a></li></ul></li>
<li class="2Depth menu_85"><a href="/ul/html.do?menu_idx=85" ><span>순회문고</span></a></li>
<li class="2Depth menu_86"><a href="/ul/module/locker/index.do?menu_idx=86" ><span>사물함신청</span></a></li>
<li class="2Depth menu_89"><a href="/ul/html.do?menu_idx=89" ><span>사서에게물어보세요</span></a></li>
<li class="2Depth menu_15"><a href="/ul/html.do?menu_idx=15" ><span>도서관협력망서비스</span></a>
<ul>
<li class="3Depth menu_29"><a href="/ul/html.do?menu_idx=29" ><span>책바다</span></a></li>
<li class="3Depth menu_30"><a href="/ul/html.do?menu_idx=30" ><span>책나래</span></a></li></ul></li></ul></li>
<li class="List 1Depth menu6 menu_6"><a href="/ul/html.do?menu_idx=6" ><span>도서관소개</span></a>
<ul class="SubMenu">
<li class="2Depth menu_97"><a href="/ul/html.do?menu_idx=97" ><span>인사말</span></a></li>
<li class="2Depth menu_98"><a href="/ul/html.do?menu_idx=98" ><span>연혁</span></a></li>
<li class="2Depth menu_99"><a href="/ul/html.do?menu_idx=99" ><span>조직/업무</span></a>
<ul>
<li class="3Depth menu_106"><a href="/ul/module/deptMng/index.do?menu_idx=106" ><span>직원현황</span></a></li></ul></li>
<li class="2Depth menu_100"><a href="/ul/html.do?menu_idx=100" ><span>시설/자료현황</span></a>
<ul>
<li class="3Depth menu_110"><a href="/ul/html.do?menu_idx=110" ><span>시설현황</span></a></li>
<li class="3Depth menu_111"><a href="/ul/html.do?menu_idx=111" ><span>자료현황</span></a></li></ul></li>
<li class="2Depth menu_104"><a href="/ul/module/calendarManage/index.do?menu_idx=104" ><span>이달의행사</span></a></li>
<li class="2Depth menu_105"><a href="/ul/html.do?menu_idx=105" ><span>기관CI</span></a></li>
<li class="2Depth menu_172"><a href="/ul/html.do?menu_idx=172" ><span>지역안내</span></a>
<ul>
<li class="3Depth menu_173"><a href="/ul/html.do?menu_idx=173" ><span>지역명소</span></a></li></ul></li></ul></li>
<li style="display:none" class="List 1Depth menu7 menu_112"><a href="/ul/html.do?menu_idx=112" ><span>나의도서관</span></a>
<ul class="SubMenu">
<li class="2Depth menu_195"><a href="/ul/module/myDashBoard/index.do?menu_idx=195" ><span>My Dashboard</span></a></li>
<li style="display:none" class="2Depth menu_113"><a href="/ul/intro/join/modifyForm.do?menu_idx=113" ><span>회원정보수정</span></a></li>
<li style="display:none" class="2Depth menu_114"><a href="/ul/html.do?menu_idx=114" ><span>도서대출내역</span></a>
<ul>
<li style="display:none" class="3Depth menu_115"><a href="/ul/intro/search/loan/index.do?menu_idx=115" ><span>대출중도서</span></a></li>
<li style="display:none" class="3Depth menu_116"><a href="/ul/intro/search/loan/history.do?menu_idx=116" ><span>대출이력</span></a></li>
<li style="display:none" class="3Depth menu_117"><a href="/ul/intro/search/resve/index.do?menu_idx=117" ><span>예약중도서</span></a></li>
<li style="display:none" class="3Depth menu_118"><a href="/ul/intro/search/hope/history.do?menu_idx=118" ><span>희망도서신청내역</span></a></li>
<li class="3Depth menu_197"><a href="/ul/intro/search/out/history.do?menu_idx=197" ><span>상호대차신청내역</span></a></li>
<li class="3Depth menu_198"><a href="/ul/module/bookReview/history.do?menu_idx=198" ><span>서평작성내역</span></a></li></ul></li>
<li class="2Depth menu_192"><a href="/ul/intro/join/klMemberForm.do?menu_idx=192" ><span>책이음회원가입</span></a></li>
<li style="display:none" class="2Depth menu_174"><a href="/ul/module/teach/applyList.do?menu_idx=174" ><span>수강신청내역</span></a></li>
<li style="display:none" class="2Depth menu_188"><a href="/ul/module/facility/apply.do?menu_idx=188" ><span>시설물이용신청내역</span></a></li>
<li style="display:none" class="2Depth menu_186"><a href="/ul/module/sdi/index.do?menu_idx=186" ><span>SDI 서비스</span></a></li>
<li class="2Depth menu_205"><a href="/ul/module/bookBasket/index.do?menu_idx=205" ><span>나의관심도서</span></a></li>
<li style="display:none" class="2Depth menu_175"><a href="/ul/module/excursions/apply.do?menu_idx=175" ><span>견학신청내역</span></a></li>
<li style="display:none" class="2Depth menu_189"><a href="/ul/module/boardHistory/index.do?menu_idx=189" ><span>게시글/댓글/서평 현황</span></a></li>
<li style="display:none" class="2Depth menu_190"><a href="/ul/module/loginLog/index.do?menu_idx=190" ><span>접속이력</span></a></li>
<li class="2Depth menu_200"><a href="/ul/module/teacherReqManage/apply.do?menu_idx=200" ><span>강사등록신청내역</span></a></li>
<li style="display:none" class="2Depth menu_176"><a href="/ul/intro/join/changePwForm.do?menu_idx=176" ><span>비밀번호변경</span></a></li>
<li style="display:none" class="2Depth menu_177"><a href="/ul/intro/join/secessionForm.do?menu_idx=177" ><span>회원탈퇴</span></a></li>
<li class="2Depth menu_201"><a href="/ul/module/bookKeyword/index.do?menu_idx=201" ><span>능동형도서추천</span></a></li>
<li class="2Depth menu_202"><a href="/ul/intro/join/untactForm.do?menu_idx=202" ><span>경북도민인증</span></a></li>
<li class="2Depth menu_203"><a href="/ul/intro/join/indexDls.do?menu_idx=203" ><span>경북학생인증</span></a></li></ul></li></ul>
<a href="/ul/sitemap/index.do?menu_idx=148" class="last-box-a"><img src="/resources/common/img/sitemap_icon_b.png" alt="사이트맵" class="last-box"></a>

					<div class="mmode">
						<a href="https://www.gbelib.kr/ul/intro/login/index.do?menu_idx=121" class="btn1">
									<i class="fa fa-lock"></i>
									<span>로그인</span>
								</a>
								<a href="https://www.gbelib.kr/ul/intro/join/index.do?menu_idx=120" class="btn2">
									<i class="fa fa-user-plus"></i>
									<span>회원가입</span>
								</a>
							</div>
				</div>
				<!-- menu E -->
			</div>
			<div class="mask">&nbsp;</div>
		</div>
	</div>
</div><div class="popupWrap section">
		<div id="popupLayer">
			</div>
	</div>
	
	<div id="fullpage" >
		<!--메인-->
		<div id="main0" class="section">
			<div class="source-box">
				<p>출처: 울릉홍보관 2022년 독도 풍경</p>
			</div>
			<div class="main0-wrap">
				<div class="sections">
					<div class="main0-box-top">
						<div class="main0-inner-left">
							<div class="slogan">
								<p class="text-01">경상북도교육청 울릉도서관</p>
								<p class="text-02">
									책 읽는 작은 여유가<br/>
									마음 속의<br/>
									큰 행복입니다!
								</p>
							</div>
							<div class="search-area" id="main_search">
								<form id="mainSearchForm" action="/ul/intro/search/index.do">
								<input type="hidden" name="menu_idx" value="8">
								<input type="hidden" name="booktype" value="L_TITLEAUTHOR">
								<fieldset>
									<legend class="blind">통합검색</legend>
									<div class="main-box">
										<div class="box1">
											<div class="box2">
												<label for="search_text_1" class="blind">통합자료검색</label>
												<input name="search_text" id="search_text_1" type="text" class="text" placeholder="찾으시는 도서 정보를 입력하세요." style="ime-mode:active;"/>
											</div>
										</div>
										<button id="main-search-btn">검색하기</button>
									</div>
								</fieldset>
							</div>
						</div>		
						<div class="main0-inner-right">
							<img src="/resources/common/img/main_type01/main-img.png" alt="">
						</div>
					</div>
					<div class="end"></div>
					<div class="main0-box-botton">
						<div class="qmenu">
							<ul>
								<li class="qm1">
									<a href="/ul/intro/search/loan/index.do?menu_idx=115" title="대출조회·예약">
										<div class="image"><img src="/resources/homepage/ul/img/q1.png" alt="대출조회·예약"></div>
										<div class="qtxt">대출조회·예약</div>
									</a>
								</li>
								<li class="qm2">
									<a href="/ul/intro/search/hope/index.do?menu_idx=16" title="희망도서신청">
										<div class="image"><img src="/resources/homepage/ul/img/q2.png" alt="희망도서신청"></div>
										<div class="qtxt">희망도서신청</div>
									</a>
								</li>
								<li class="qm3">
									<a href="/ul/module/teach/index.do?menu_idx=191&searchCate1=16,17" title="문화행사신청">
										<div class="image"><img src="/resources/homepage/ul/img/q5.png" alt="문화행사신청"></div>
										<div class="qtxt">문화행사신청</div>
									</a>
								</li>
								<li class="qm4">
									<a href="https://www.gbelib.kr/elib/index.do" title="전자도서관 새창으로 열립니다." target="_blank">
										<div class="image"><img src="/resources/homepage/ul/img/q3.png" alt="전자도서관"></div>
										<div class="qtxt">전자도서관</div>
									</a>
								</li>
								<li class="qm5">
									<a href="/ul/html.do?menu_idx=90" title="이용안내">
										<div class="image"><img src="/resources/homepage/ul/img/q4.png" alt="이용안내"></div>
										<div class="qtxt">이용안내</div>
									</a>
								</li>
								<li class="qm6">
									<a href="/ul/board/index.do?menu_idx=74&manage_idx=531" title="자주하는질문">
										<div class="image"><img src="/resources/homepage/ul/img/q6.png" alt="자주하는질문"></div>
										<div class="qtxt">자주하는질문</div>
									</a>
								</li>
								<li class="qm7">
								<a href="javascript:alert('스마트 체험도서관은 울릉도서관 소속 정회원만 이용 가능한 서비스입니다. 로그인 및 도서관 소속 여부를 확인해주세요.');">
									<div class="image"><img src="/resources/homepage/ul/img/q7.png" alt="스마트도서관"></div>
										<div class="qtxt">스마트도서관</div>
									</a>
								</li>
								<li class="qm8">
									<a href="/ul/html.do?menu_idx=29" title="책바다서비스">
										<div class="image"><img src="/resources/homepage/ul/img/q8.png" alt="책바다서비스"></div>
										<div class="qtxt">책바다서비스</div>
									</a>
								</li>
								<!-- <li class="qm1">
<a style="background-image:url('/data/quickMenu/h26/1488178631284')" href="/ul/intro/search/loan/index.do?menu_idx=115">
<span>대출조회/예약</span></a></li>
<li class="qm2">
<a style="background-image:url('/data/quickMenu/h26/1488178645096')" href="/ul/intro/search/hope/req.do?menu_idx=16">
<span>희망도서신청</span></a></li>
<li class="qm3">
<a style="background-image:url('/data/quickMenu/h26/1488178684762')" href="/ul/module/teach/index.do?menu_idx=166">
<span>수강신청</span></a></li>
<li class="qm4">
<a style="background-image:url('/data/quickMenu/h26/1488178655394')" target="_blank" href="http://www.gbelib.kr/elib/index.do">
<span>전자도서관</span></a></li>
<li class="qm5">
<a style="background-image:url('/data/quickMenu/h26/1488178674119')" href="/ul/html.do?menu_idx=60">
<span>자원봉사신청</span></a></li>
 -->
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!--공지+팝업존-->
		<div id="main1" class="section">
			<div class="main1_wrap">
				<div class="main1-inner-left">			
					<div class="notice-box">
						<div class="title">
							<h3>공지사항</h3>
							<a href="/ul/board/index.do?menu_idx=58&manage_idx=528" title="공지사항 더보기 버튼">
								<img src="/resources/common/img/notice_type04/more-btn.png" alt="공지사항 더보기 이미지" title="공지사항 더보기 이미지">
							</a>
						</div>

						<div class="list">
							<ul>
								<ul>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=244560" title="게시글 자세히 보기">
											울릉도서관 6월 휴관일 안내</a>
										<span>2023-06-02</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=244406" title="게시글 자세히 보기">
											2023년 상반기 평생교육 강좌 만족도 설문조사 안내</a>
										<span>2023-05-31</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=243369" title="게시글 자세히 보기">
											울릉도서관 5월 휴관일 안내</a>
										<span>2023-04-30</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=242277" title="게시글 자세히 보기">
											🎉 제59회 도서관주간 및 세계 책의 날 행사 안내</a>
										<span>2023-04-04</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=241203" title="게시글 자세히 보기">
											어린이 독서회 [Book쟁이] 회원 모집</a>
										<span>2023-03-14</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=240652" title="게시글 자세히 보기">
											디지털 자료실 이용 제한 안내</a>
										<span>2023-02-28</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=240433" title="게시글 자세히 보기">
											울릉도서관 삼일절(3. 1.) 휴관 안내</a>
										<span>2023-02-23</span>
									</li>
								<li>
										<a href="/ul/board/view.do?menu_idx=58&amp;manage_idx=528&amp;board_idx=240421" title="게시글 자세히 보기">
											울릉도서관 화장실 보수 공사 안내</a>
										<span>2023-02-22</span>
									</li>
								</ul>
						</div>
					</div>
				</div>
				<div class="main1-inner-right">
					<div class="popupzone-box">
						<div class="title">
							<h3>팝업존</h3>
						</div>
						<div class="popupzonenew">
							<ul>
<li>
<a href=" http://www.gbelib.kr/ul/board/view.do?menu_idx=58&manage_idx=528&board_idx=244560">
<img alt="5월 휴관" src="/data/popupZone/h26/1685665582984"/></a></li>
<li>
<a href=" ">
<img alt="두배로" src="/data/popupZone/h26/1683605178662"/></a></li>
<li>
<a href="https://www.gbelib.kr/ul/board/index.do?menu_idx=21&manage_idx=529">
<img alt="5,6 추천도서" src="/data/popupZone/h26/1683081896240"/></a></li></ul>
</div>
					</div>
				</div>			
			</div>
		</div>
		
		<!--일정+행사-->
		<div id="main2" class="section">
			<div class="main2-wrap mid-sections">
				<div class="calendar-box">
					<div class="title">
						<h3>CALENDAR</h3>
						<a href="/ul/module/calendarManage/index.do?menu_idx=104" title="일정 더보기 버튼">
							<img src="/resources/common/img/culture_type02/more-btn-b.png" alt="일정 더보기 이미지" title="일정 더보기 이미지">
						</a>
					</div>
					<div class="calendar-box" id="calendar-box">
					</div>
				</div>
				<div class="event-box">
					<div class="title">
						<h3>EVENT</h3>
						<a href="/ul/module/teach/index.do?menu_idx=191&searchCate1=16,17" title="행사 더보기 버튼">
							<img src="/resources/common/img/culture_type02/more-btn-b.png" alt="행사 더보기 이미지" title="행사 더보기 이미지">
						</a>
					</div>
					<div class="list">
						<ul>
							<li>
									<a href="javascript:void(0)">
										<div>
											등록된 강좌가 없습니다.
										</div>
									</a>
								</li>
							</ul>
					</div>
				</div>
			</div>
		</div>
		
		<!--도서-->
		<div id="main5" class="section">
			<div class="main5-visual">
				<script>
					$(function(){
						var _width = $(window).width();
						var _bookListTop;
						var _bookListBottom;

							var Books = function(){
								try {
									if( _bookListTop ) _bookListTop.destroySlider();
									if( _bookListBottom ) _bookListBottom.destroySlider();
								} catch (e) {
									// TODO: handle exception
								}

								if( _width <= 380 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 190,
										slideMargin: 0
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 1,
										slideWidth: 190,
										slideMargin: 0
									});
								}
								else if( _width <= 550 && _width > 380 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 2,
										slideWidth: 190,
										slideMargin: 0
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 2,
										slideWidth: 190,
										slideMargin: 0
									});
								}
								else if( _width <= 768 && _width > 550 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 3,
										slideWidth: 190,
										slideMargin: 10
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 3,
										slideWidth: 190,
										slideMargin: 10
									});
								}
								else if( _width <= 1024 && _width > 768 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 20
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 20
									});
								}
								else if( _width <= 1600 && _width > 1024 ){
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 10
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 4,
										slideWidth: 190,
										slideMargin: 20
									});
								}
								else {
									_bookListTop = $('.bookListTop ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 5,
										slideWidth: 190,
										slideMargin: 30
									});

									_bookListBottom = $('.bookListBottom ul').bxSlider({
										auto: true,
										autoHover: true,
										speed: 500,
										pager: false,
										moveSlides:1,
										maxSlides: 5,
										slideWidth: 190,
										slideMargin: 30
									});
								}
							};
							Books();
							$(window).on('resize', function(){
								_width = $(window).width();
								Books();
							});
					});
				</script>
				<div class="main5-top-wrap">
					<div class="main5-top">
						<div class="mid-sections">
							<div class="main5-top-left">
								<div class="title">
									<h2><div class='stxt'>NEW ARRIVAL BOOK</div><div class='ltxt'>신착도서</div></h2>
									<a href="/ul/intro/search/newBook/index.do?menu_idx=12" class="more"><img src="/resources/common/img/book_type01/book-more-btn.png" alt="더보기" /></a>
								</div>
							</div>
							<div class="main5-top-right">
								<div class="outer">
									<div class="inner">
										<div class="bookListTop">
											<ul>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300838&vImg=https://shopping-phinf.pstatic.net/main_3707888/37078880628.20230216071303.jpg&menu_idx=12">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3707888/37078880628.20230216071303.jpg" alt="군중의 망상" title="군중의 망상"/>
															</div>
															<div class="btxt">
																군중의 망상</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300839&vImg=https://shopping-phinf.pstatic.net/main_3847306/38473067631.20230314164510.jpg&menu_idx=12">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3847306/38473067631.20230314164510.jpg" alt="중화학공업화" title="중화학공업화"/>
															</div>
															<div class="btxt">
																중화학공업화</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300840&vImg=https://shopping-phinf.pstatic.net/main_3804077/38040776620.20230313183507.jpg&menu_idx=12">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3804077/38040776620.20230313183507.jpg" alt="해커와 국가" title="해커와 국가"/>
															</div>
															<div class="btxt">
																해커와 국가</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300841&vImg=https://bookthumb-phinf.pstatic.net/cover/214/041/21404185.jpg&menu_idx=12">
															<div class="">
																<img src="https://bookthumb-phinf.pstatic.net/cover/214/041/21404185.jpg" alt="남다른 방구석, 엄마의 새벽 4시" title="남다른 방구석, 엄마의 새벽 4시"/>
															</div>
															<div class="btxt">
																남다른 방구석, 엄마의 새벽 4시</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300842&vImg=&menu_idx=12">
															<div class="">
																<img src="/resources/homepage/gm/img/noimg1.png" alt="(똑똑한 두뇌 게임) 체스 왕" title="(똑똑한 두뇌 게임) 체스 왕"/>
															</div>
															<div class="btxt">
																(똑똑한 두뇌 게임) 체스 왕</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300843&vImg=&menu_idx=12">
															<div class="">
																<img src="/resources/homepage/gm/img/noimg1.png" alt="(똑똑한 두뇌 게임) 체스 왕 : 실전 편" title="(똑똑한 두뇌 게임) 체스 왕 : 실전 편"/>
															</div>
															<div class="btxt">
																(똑똑한 두뇌 게임) 체스 왕 : 실전 편</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300844&vImg=https://shopping-phinf.pstatic.net/main_3472854/34728545619.20221019114538.jpg&menu_idx=12">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3472854/34728545619.20221019114538.jpg" alt="감추고 싶은 폴더" title="감추고 싶은 폴더"/>
															</div>
															<div class="btxt">
																감추고 싶은 폴더</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300845&vImg=https://bookthumb-phinf.pstatic.net/cover/162/144/16214429.jpg&menu_idx=12">
															<div class="">
																<img src="https://bookthumb-phinf.pstatic.net/cover/162/144/16214429.jpg" alt="지적 대화를 위한 넓고 얕은 지식 . 1  현실 - 역사·경제·정치·사회·윤리" title="지적 대화를 위한 넓고 얕은 지식 . 1  현실 - 역사·경제·정치·사회·윤리"/>
															</div>
															<div class="btxt">
																지적 대화를 위한 넓고 얕은 지식 . 1  현실 - 역사·경제·정치·사회·윤리</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300846&vImg=https://bookthumb-phinf.pstatic.net/cover/162/144/16214430.jpg&menu_idx=12">
															<div class="">
																<img src="https://bookthumb-phinf.pstatic.net/cover/162/144/16214430.jpg" alt="지적 대화를 위한 넓고 얕은 지식 . 2  현실 너머 - 철학·과학·예술·종교·신비 편" title="지적 대화를 위한 넓고 얕은 지식 . 2  현실 너머 - 철학·과학·예술·종교·신비 편"/>
															</div>
															<div class="btxt">
																지적 대화를 위한 넓고 얕은 지식 . 2  현실 너머 - 철학·과학·예술·종교·신비 편</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/intro/search/detail.do?vLoca=00147017&vCtrl=000004300847&vImg=https://shopping-phinf.pstatic.net/main_3358190/33581909627.20220722093443.jpg&menu_idx=12">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3358190/33581909627.20220722093443.jpg" alt="에이블 : 1,200억 투자가의 마인드" title="에이블 : 1,200억 투자가의 마인드"/>
															</div>
															<div class="btxt">
																에이블 : 1,200억 투자가의 마인드</div>
														</a>
													</li>
												</ul>
										</div>
									</div>
								</div>
							</div>
							<div class="end"></div>
						</div>
					</div>
				</div>
				<div class="main5-bottom-wrap">
					<div class="main5-bottom">
						<div class="mid-sections">
							<div class="main5-bottom-right">
								<div class="title">
									<h2><div class='stxt'>RECOMMEND BOOK</div><div class='ltxt'>추천도서</div></h2>
									<a href="/ul/board/index.do?menu_idx=21&manage_idx=529" class="more"><img src="/resources/common/img/book_type01/book-more-btn.png" alt="더보기" /></a>
								</div>
							</div>
							<div class="main5-bottom-left">
								<div class="outer">
									<div class="inner">
										<div class="bookListBottom">
											<ul>
												<li class="item">
														<a href="/ul/board/view.do?menu_idx=21&manage_idx=529&board_idx=243228">
															<div class="">
																<img src="https://bookthumb-phinf.pstatic.net/cover/214/806/21480609.jpg" alt="악당이 된 녀석들" title="악당이 된 녀석들" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</div>
															<div class="btxt">
																악당이 된 녀석들</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/board/view.do?menu_idx=21&manage_idx=529&board_idx=243227">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3548319/35483195620.20221027181455.jpg" alt="안녕 본본" title="안녕 본본" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</div>
															<div class="btxt">
																안녕 본본</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/board/view.do?menu_idx=21&manage_idx=529&board_idx=243226">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3801892/38018924625.20230313185352.jpg" alt="손톱달의 비밀" title="손톱달의 비밀" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</div>
															<div class="btxt">
																손톱달의 비밀</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/board/view.do?menu_idx=21&manage_idx=529&board_idx=243224">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3755365/37553652619.20230201070943.jpg" alt="네가 사라진 날" title="네가 사라진 날" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</div>
															<div class="btxt">
																네가 사라진 날</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/board/view.do?menu_idx=21&manage_idx=529&board_idx=243223">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3764956/37649562618.20230214162318.jpg" alt="당신의 세계는 아직도 바다와 빗소리와 작약을 취급하는지" title="당신의 세계는 아직도 바다와 빗소리와 작약을 취급하는지" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</div>
															<div class="btxt">
																당신의 세계는 아직도 바다와 빗소리와 작약을 취급하는지</div>
														</a>
													</li>
												<li class="item">
														<a href="/ul/board/view.do?menu_idx=21&manage_idx=529&board_idx=243222">
															<div class="">
																<img src="https://shopping-phinf.pstatic.net/main_3804081/38040810631.20230313183950.jpg" alt="어른의 말센스" title="어른의 말센스" onerror="this.src='/resources/homepage/gm/img/noimg1.png'"/>
																	</div>
															<div class="btxt">
																어른의 말센스</div>
														</a>
													</li>
												</ul>
										</div>
									</div>
								</div>
							</div>

							<div class="end"></div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- footer_section -->
		<div class="bottom-banner-wrap">
			<div class="banner-box">
				<div class="sections">
					<!-- 작업할거 없음. 이미 다 처리. -->
					<div class="banner-wrap type6">
						<div class="banner-t6">
							<div class="control">
								<a class="prev" href="#prev"><img src="/resources/homepage/gbelib/img/section04/banner-prev-btn.png" alt="이전" /><span class="blind">이전</span></a>
								<a class="next" href="#next"><img src="/resources/homepage/gbelib/img/section04/banner-next-btn.png" alt="다음" /><span class="blind">다음</span></a>
							</div>
						</div>
						<div class="banner-box6">
							<ul class="banner-roll">
<li>
<span>
<a target="_blank" href="http://www.gbe.kr/main/main.do">
<img alt="경상북도교육청" src="/data/banner/h26/1673495359451"/></a></span></li>
<li>
<span>
<a target="_blank" href="http://www.kbuled.go.kr/">
<img alt="경상북도울릉교육지원청" src="/data/banner/h26/1673494940743"/></a></span></li>
<li>
<span>
<a target="_blank" href="http://www.ulleung.go.kr/ko/main.htm">
<img alt="울릉군" src="/data/banner/h26/1673495351104"/></a></span></li>
<li>
<span>
<a target="_blank" href="https://www.nl.go.kr/">
<img alt="국립중앙도서관" src="/data/banner/h26/1673494954429"/></a></span></li></ul>
</div>
						<div class='banner-t6-after'>
							<div class="control">
								<a class="stop active" href="#stop"><img src="/resources/homepage/gbelib/img/section04/banner-stop-btn.png" alt="정지" /><span class="blind">정지</span></a>
								<a class="play" href="#play"><img src="/resources/homepage/gbelib/img/section04/banner-start-btn.png" alt="시작" /><span class="blind">시작</span></a>
								<a class="more" href="/ul/bannermap/index.do?menu_idx=180"><img src="/resources/homepage/gbelib/img/section04/banner-more-btn.png" alt="더보기" /><span class="blind">더보기</span></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="section fp-auto-height footer_area" id="foot_section">
		<div id="footer">
		<div class="top-box">
			<div class="sections">
				<div class="info">
					<h3>경상북도교육청 울릉도서관</h3>
					<address>
						<p>
							<em>(우 40218) 경북 울릉군 울릉읍 봉래길 128-10 (저동리)</em><br/>
							<em>전화 (사무실)054-791-2294, (자료실)054-791-9043, (섬초롱도서관)054-791-3064</em><br class="mobile-view"/>
							<em>팩스 054-791-5211</em>
						</p>
						<span>Copyright &copy; by Ulleung Public Library Public Library, All rights reserved.</span>
					</address>
				</div>
				<!-- <div class="info-right">
					<div class="site_link">
						<div class="sns title">SNS</div>
						<div class="sns">
							<a href="#"><img src="/resources/common/img/twitter-icon.png" onmouseover="this.src='/resources/common/img/twitter-icon-on.png'" onmouseout="this.src='/resources/common/img/twitter-icon.png'" alt="" target="_blank"/></a>
							<a href="#"><img src="/resources/common/img/facebook-icon.png" onmouseover="this.src='/resources/common/img/facebook-icon-on.png'" onmouseout="this.src='/resources/common/img/facebook-icon.png'" alt="" target="_blank"/></a>
							<a href="#"><img src="/resources/common/img/instagram-icon.png" onmouseover="this.src='/resources/common/img/instagram-icon-on.png'" onmouseout="this.src='/resources/common/img/instagram-icon.png'" alt="" target="_blank"/></a>
						</div>
					</div>
				</div> -->
			</div>
		</div>

		<div class="bottom-box">
			<div class="sections">
				<div class="">
					<div class="overflow-x">
					<div class="info">
						<a href="/ul/html.do?menu_idx=194">도서관이용규정</a>
						<span class="txt-menu-bar"></span>
						<a href="/ul/html.do?menu_idx=182">개인정보처리방침</a>
						<span class="txt-menu-bar"></span>
						<a href="/ul/html.do?menu_idx=183">영상정보처리기기운영관리방침</a>
						<span class="txt-menu-bar"></span>
						<a href="/ul/html.do?menu_idx=184">도서관서비스헌장</a>
						<span class="txt-menu-bar"></span>
						<a href="/ul/html.do?menu_idx=185">찾아오시는길</a>
					</div>
					</div>

					<div class="info-right">
						<div class="site_link">
							<select name="select" title="새창열림">
								<option value="https://www.gbelib.kr/gbelib/index.do">경상북도교육청 공공도서관</option>
								<option value="https://www.gbelib.kr/geic/index.do">경상북도교육청정보센터</option>
								<option value="https://www.gbelib.kr/gm/index.do">경상북도교육청 구미도서관</option>
								<option value="https://www.gbelib.kr/ad/index.do">경상북도교육청 안동도서관</option>
								<option value="https://www.gbelib.kr/adys/index.do">경상북도교육청 안동도서관용상분관</option>
								<option value="https://www.gbelib.kr/adps/index.do">경상북도교육청 안동도서관풍산분관</option>
								<option value="https://www.gbelib.kr/sj/index.do">경상북도교육청 상주도서관</option>
								<option value="https://www.gbelib.kr/sjhr/index.do">경상북도교육청 상주도서관화령분관</option>
								<option value="https://www.gbelib.kr/yj/index.do">경상북도교육청 영주선비도서관</option>
								<option value="https://www.gbelib.kr/yjpg/index.do">경상북도교육청 영주선비도서관풍기분관</option>
								<option value="https://www.gbelib.kr/gbccs/index.do">경상북도교육청문화원</option>
								<option value="https://www.gbelib.kr/yi/index.do">경상북도교육청 영일도서관</option>
								<option value="https://www.gbelib.kr/od/index.do">경상북도교육청 외동도서관</option>
								<option value="https://www.gbelib.kr/ycgh/index.do">경상북도교육청 금호도서관</option>
								<option value="https://www.gbelib.kr/jc/index.do">경상북도교육청 점촌도서관</option>
								<option value="https://www.gbelib.kr/jcge/index.do">경상북도교육청 점촌도서관가은분관</option>
								<option value="https://www.gbelib.kr/gw/index.do">경상북도교육청 삼국유사군위도서관</option>
								<option value="https://www.gbelib.kr/us/index.do">경상북도교육청 의성도서관</option>
								<option value="https://www.gbelib.kr/cs/index.do">경상북도교육청 청송도서관</option>
								<option value="https://www.gbelib.kr/yy/index.do">경상북도교육청 영양도서관</option>
								<option value="https://www.gbelib.kr/yd/index.do">경상북도교육청 영덕도서관</option>
								<option value="https://www.gbelib.kr/cd/index.do">경상북도교육청 청도도서관</option>
								<option value="https://www.gbelib.kr/gr/index.do">경상북도교육청 고령도서관</option>
								<option value="https://www.gbelib.kr/sjl/index.do">경상북도교육청 성주도서관</option>
								<option value="https://www.gbelib.kr/cg/index.do">경상북도교육청 칠곡도서관</option>
								<option value="https://www.gbelib.kr/yc/index.do">경상북도교육청 예천도서관</option>
								<option value="https://www.gbelib.kr/bh/index.do">경상북도교육청 봉화도서관</option>
								<option value="https://www.gbelib.kr/uj/index.do">경상북도교육청 울진도서관</option>
								<option value="https://www.gbelib.kr/ul/index.do">경상북도교육청 울릉도서관</option>
							</select>
							<a href="#move" class="sel-btn recommendSite11" title="새창열림">이동</a>
							<!-- <div>
								<div style="width:200px">
<a class="fsite type1">
<span class="f1">경상북도교육청 공공도서관</span>
<span class="f2"><i></i></span></a>
<ul style="display:none">
<li class="disabled"><a href="#">경상북도교육청 공공도서관</a></li>
<li class="disabled"><a title="경상북도교육청정보센터" href="http://www.gbelib.kr/geic/index.do">경상북도교육청정보센터</a></li>
<li class="disabled"><a title="경상북도교육청 구미도서관" href="http://www.gbelib.kr/gm/index.do">경상북도교육청 구미도서관</a></li>
<li class="disabled"><a title="경상북도교육청 안동도서관" href="http://www.gbelib.kr/ad/index.do">경상북도교육청 안동도서관</a></li>
<li class="disabled"><a title="경상북도교육청 안동도서관용상분관" href="http://www.gbelib.kr/adys/index.do">경상북도교육청 안동도서관용상분관</a></li>
<li class="disabled"><a title="경상북도교육청 안동도서관풍산분관" href="http://www.gbelib.kr/adps/index.do">경상북도교육청 안동도서관풍산분관</a></li>
<li class="disabled"><a title="경상북도교육청 상주도서관" href="http://www.gbelib.kr/sj/index.do">경상북도교육청 상주도서관</a></li>
<li class="disabled"><a title="경상북도교육청 상주도서관화령분관" href="http://www.gbelib.kr/sjhr/index.do">경상북도교육청 상주도서관화령분관</a></li>
<li class="disabled"><a title="경상북도교육청 영주선비도서관" href="http://www.gbelib.kr/yj/index.do">경상북도교육청 영주선비도서관</a></li>
<li class="disabled"><a title="경상북도교육청 영주선비도서관풍기분관" href="http://www.gbelib.kr/yjpg/index.do">경상북도교육청 영주선비도서관풍기분관</a></li>
<li class="disabled"><a title="경상북도교육청문화원" href="http://www.gbelib.kr/gbccs/index.do">경상북도교육청문화원</a></li>
<li class="disabled"><a title="경상북도교육청 영일도서관" href="http://www.gbelib.kr/yi/index.do">경상북도교육청 영일도서관</a></li>
<li class="disabled"><a title="경상북도교육청 외동도서관" href="http://www.gbelib.kr/od/index.do">경상북도교육청 외동도서관</a></li>
<li class="disabled"><a title="경상북도교육청 금호도서관" href="http://www.gbelib.kr/ycgh/index.do">경상북도교육청 금호도서관</a></li>
<li class="disabled"><a title="경상북도교육청 점촌도서관" href="http://www.gbelib.kr/jc/index.do">경상북도교육청 점촌도서관</a></li>
<li class="disabled"><a title="경상북도교육청 점촌도서관가은분관" href="http://www.gbelib.kr/jcge/index.do">경상북도교육청 점촌도서관가은분관</a></li>
<li class="disabled"><a title="경상북도교육청 삼국유사군위도서관" href="http://www.gbelib.kr/gw/index.do">경상북도교육청 삼국유사군위도서관</a></li>
<li class="disabled"><a title="경상북도교육청 의성도서관" href="http://www.gbelib.kr/us/index.do">경상북도교육청 의성도서관</a></li>
<li class="disabled"><a title="경상북도교육청 청송도서관" href="http://www.gbelib.kr/cs/index.do">경상북도교육청 청송도서관</a></li>
<li class="disabled"><a title="경상북도교육청 영양도서관" href="http://www.gbelib.kr/yy/index.do">경상북도교육청 영양도서관</a></li>
<li class="disabled"><a title="경상북도교육청 영덕도서관" href="http://www.gbelib.kr/yd/index.do">경상북도교육청 영덕도서관</a></li>
<li class="disabled"><a title="경상북도교육청 청도도서관" href="http://www.gbelib.kr/cd/index.do">경상북도교육청 청도도서관</a></li>
<li class="disabled"><a title="경상북도교육청 고령도서관" href="http://www.gbelib.kr/gr/index.do">경상북도교육청 고령도서관</a></li>
<li class="disabled"><a title="경상북도교육청 성주도서관" href="http://www.gbelib.kr/sjl/index.do">경상북도교육청 성주도서관</a></li>
<li class="disabled"><a title="경상북도교육청 칠곡도서관" href="http://www.gbelib.kr/cg/index.do">경상북도교육청 칠곡도서관</a></li>
<li class="disabled"><a title="경상북도교육청 예천도서관" href="http://www.gbelib.kr/yc/index.do">경상북도교육청 예천도서관</a></li>
<li class="disabled"><a title="경상북도교육청 봉화도서관" href="http://www.gbelib.kr/bh/index.do">경상북도교육청 봉화도서관</a></li>
<li class="disabled"><a title="경상북도교육청 울진도서관" href="http://www.gbelib.kr/uj/index.do">경상북도교육청 울진도서관</a></li>
<li class="disabled"><a title="경상북도교육청 울릉도서관" href="http://www.gbelib.kr/ul/index.do">경상북도교육청 울릉도서관</a></li></ul></div>
<a class="btn" href="#">이동</a>
</div> -->
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

</div>
	</div>
</div>
</body>
</html>

<script type="text/javascript">
function fullPage() {
	var myFullpage = new fullpage('#fullpage', {
		anchors: ['firstPage', 'secondPage', '3rdPage', '4thPage'],
		navigation:true,
		showActiveTooltip: true,
		menu: '#menu',
		responsiveWidth: 1025,
		afterLoad: function(origin, destination, direction){
			var cur_page = destination.index+1;
			if (destination.index == 0 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}  else if( destination.index == 1 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}	else if( destination.index == 2 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}  else if( destination.index == 3 ) {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			} else {
				$('#header').removeClass("background-white");
				$('.Gnb').css('border-top','1px solid #e6e6e6');
				$('.Gnb').css('border-bottom','1px solid #e6e6e6');
				$('.Gnb').css('background','#fff');
				$('.tnb').css('background','#f2f2f2');
			}
		},
		afterResponsive: function(isResponsive){}
	});
};

fullPage();

// 모바일일 경우 fullpage 미사용
if ( $(window).width() < 1025 ) {
	if ($('#fullpage').hasClass('fp-destroyed')){
	} else {
		fullpage_api.destroy('all');
	}
} else {
	fullPage();
};

// 리사이즈 될때 모바일 화면에서 fullpage 미사용
$( window ).resize( function(e) {
	if ( $(window).width() < 1025 ) {
		if ($('#fullpage').hasClass('fp-destroyed')){
		} else {
			fullpage_api.destroy('all');
		}
	} else {
		fullPage();
	};
});
</script>