$(document).ready(function(){
	
const pathArr = location.pathname.split("/");
const storeId = pathArr[pathArr.length-1];
 
 
const dateInput = document.getElementById("date");
dateInput.valueAsDate = new Date();
 
// getDetail이 true일때 상세보기 가능
let getDetail = true;
 
function graphDraw(data, format, title){
	let html = "";
	for(i=0;i<data.length-1;i++) {
		html +=
		`<li>
			<span class="sales"></span>
			<div class="graph" data-date="${data[i].orderDate}"></div>
			<span class="graph_date">${moment(data[i].orderDate).format(format) }</span>
		</li>`
	}
	$(".graph_box ul").html(html);
	
	
	if(!data[data.length-1]) {
		$("main h1").text(title +"0원");
		return;
	}
		
	const total = data[data.length-1].total;
	
	$("main h1").text(title + total.toLocaleString() + "원");
	
	for(i=0;i<data.length-1;i++) {
		const sum = data[i].total;
		const avg = sum / total * 100;
		
		$(".graph_box li").eq(i).find(".graph").css("height", avg +"%");
		
		if(sum != 0){
			$(".graph_box li").eq(i).find(".sales").text((sum/10000).toFixed(1));
		}
	}
}
 
 
	
function sales(term){
	const date = moment(new Date()).format("YYYY-MM");
	
	let title = "";
	let format = "";
	const data = {
		date : date,
		storeId : storeId
	};
	
	switch(term) {
		case "week": {
			format = "MM월 DD일";
			data.term = "week";
			title = "이번 주 총 합계 ";
			break;
		} 
		case "thisMonth": {
			format = "D";
			data.term = "month";
			title = moment(date).format("M") + "월 총 합계 ";
			break;
		} 
		
		case "month": {
			format = "D";
			data.date = $("#date").val();
			data.term = "month";
			title = moment(data.date).format("M") + "월 총 합계 ";
			break;
		}
		
		
		case "year": {
			format = "MM월"
			data.term = "year";
			title = moment(date).format("YYYY") + "년 총 합계 ";
			break;
		}
	}
	
	$.ajax({
		url: "/admin/management/sales",
		type: "GET",
		data: data
	})
	.done(function(result) {
		console.log(result);
		
		graphDraw(result, format, title);
		
	})
/*	.fail(function(data){
		alert("에러");
	})*/
}
 
 
 
 
 
// 그래프 가로 스크롤
(function(){
	let x;
	let left;
	let down;
	
  	const target = $(".graph_section");
	    
	target.mousedown(function(e){
	  down = true;
	  x = e.pageX;
	  left = $(this).scrollLeft();
	});
	
	$(window).mousemove(function(e){
	  if(down){
	    var newX = e.pageX;
	    target.scrollLeft(left - newX + x);
	  }
	});
	
	$(window).mouseup(function(e){
		down = false;
	});
})();
  
		
		
		
// 그래프 막대 그리기
function detailHtml(result){
	let html = `<div>메뉴</div>
				<div>수량</div>
				<div>가격</div>`;
				
	for(i=0;i<result.menuList.length;i++) {
		const menu = result.menuList[i];
		const option = menu.optionName == null ? "" : "[" + menu.optionName + "]";
		
		html +=
			`<div>${menu.foodName}${option }</div>
			 <div>${menu.amount}</div>
			 <div>${menu.totalPrice.toLocaleString()}</div>`;
	}
	
	return html;
}
 
 
// 하루 매출 상세보기
function salesDetail(data, fnc){
	$.ajax({
		url: "/admin/management/salesDetail",
		type: "GET",
		data: data
	})
	.done(function(result){
		fnc(result);
		
	})
/*	.fail(function(){
		alert("에러");
	})*/
}
 
 
 
 
// 기본페이지 주 매출
sales("week");
 
// 월 매출
$(".month_btn").click(function(){
	sales("thisMonth");
	getDetail = true;
})
 
// 다른 달 일 매출
$(".other_month_search").click(function(){
	sales("month");
	getDetail = true;
})
 
// 이번주 매출
$(".week_btn").click(function(){
	sales("week");
	getDetail = true;
})
 
// 올해 매출
$(".year_btn").click(function(){
	sales("year");
	getDetail = false;
})
 
 
 
// 오늘 매출 실행함수
const todayDetail = function(result){
	$("#today").text(result.total.toLocaleString() +"원");
	const html = detailHtml(result);
	
	$(".today_detail .sales_today_detail").html(html);
}
 
// 오늘 매출 보기
salesDetail({storeId : storeId}, todayDetail);
 
 
// 오늘 매출 상세 표시
$(".today button").click(function(){
	$(".today_detail").fadeToggle(200);
});
 
 
// 이름순 정렬
$(".today_detail .sort_name").click(function(){
	const data ={
		storeId : storeId, 
	};
	
	if($(this).hasClass("reverse")) {
		$(this).removeClass("reverse");
		data.sort = "nameR";
	} else {
		$(this).addClass("reverse");
		data.sort = "name";
	}
	
	salesDetail(data, todayDetail);
})
 
 
// 가격순 정렬
$(".today_detail .sort_price").click(function(){
	const data ={
		storeId : storeId, 
	};
	
	if($(this).hasClass("reverse")) {
		$(this).removeClass("reverse");
		data.sort = "priceR";
		
	} else {
		$(this).addClass("reverse");
		data.sort = "price";
	}
	
	salesDetail(data, todayDetail);
})
 
 
 
const detail = function(result) {
	const html = detailHtml(result);
	$(".other_detail .sales_today_detail").html(html);
}
 
 
 
 
// 그래프 막대 클릭
$(document).on("click", ".graph",  function(){
	if(getDetail) {
		const date = $(this).data("date");
		const data ={storeId : storeId, date : date};
		
		salesDetail(data, function(result) {
			$(".other_detail").show();
			const offset = $(".other_detail").offset().top /2;
			$("html").animate({ scrollTop: offset }, 400);
		
			const html = detailHtml(result);
			$(".other_detail .sales_today_detail").html(html);
            $("#other_detail_date").text(date);
		});
	}
})
 
// 다른날 상세보기 이름순 정렬 (그래프클릭)
$(".other_detail .sort_name").click(function(){
	const data ={
		storeId : storeId, 
	};
	
	if($(this).hasClass("reverse")) {
		$(this).removeClass("reverse");
		data.sort = "nameR";
	} else {
		$(this).addClass("reverse");
		data.sort = "name";
	}
	
	salesDetail(data, detail);
	
})
 
// 다른날 상세보기 가격순 정렬 (그래프클릭)
$(".other_detail .sort_price").click(function(){
	const data ={
		storeId : storeId, 
	};
	
	if($(this).hasClass("reverse")) {
		$(this).removeClass("reverse");
		data.sort = "priceR";
		
	} else {
		$(this).addClass("reverse");
		data.sort = "price";
	}
	
	salesDetail(data, detail);
})
 
 
 
 
 
 
 
})
