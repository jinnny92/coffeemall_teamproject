
  function test2(result, filename, filekey) {
	if(!isImg(filename)){
		result = "/resources/img/일반파일.png";
	}
	
	
   let str = `
   <div class="col mb-4">
   <div class="card filename border-primary text-center">
   <div>
      <img src="${result}" alt="업로드한 파일의 썸네일" width="100px" height="100px">
      </div>
      <div class="card-body">
          <p class="card-text">${filename}</p>
           <a href="#" data-filekey = "${filekey}" data-filename="new" class="btn btn-secondary btn_del_item">삭제</a> 
      </div>
   </div>
</div>

   `;

   return str;

}



 
function test(result, filename) {
	if(!isImg(filename)){
		result = "/resources/img/일반파일.png";
	}
	
	
   let str = `
   <div class="col mb-4">
   <div class="card filename border-primary text-center">
   <div>
      <img src="${result}" alt="업로드한 파일의 썸네일" width="100px" height="100px">
      </div>
      <div class="card-body">
          <p class="card-text">${filename}</p>
      </div>
   </div>
</div>

   `;

   return str;

}

 function getAllUploadForUpdateUI(qno, uploadedItems){
   $.getJSON("/qna/"+qno+"/uploadall", function(data){
      for(let i=0; i<data.length; i++){
         let filename = data[i];
         let str = makeUploadItemTag2(filename);
         uploadedItems.append(str);
      }
      
      
   });
   
   
}
 
 function getAllUpload(qno, uploadItems) {
	$.getJSON("/qna/"+qno+"/uploadall", function(data){
		for(let i=0; i<data.length; i++) {
			let filename = data[i];
			let str = makeUploadItemTagForRead(filename);
			
			uploadItems.append(str);
		}
		
	});
}


function makeUploadItemTagForRead(filename) {
	
	let imgSrc = "";
	if(isImg(filename)) {
		imgSrc = "/displayfile?filename=" + filename;
	}else {
		imgSrc = "/resources/img/일반파일.jpg";
	}
	
	
	let aHref = "";
	if(isImg(filename)) {
		aHref = "/displayfile?filename=" + getImgFilePath(filename); 
	}else {
		aHref = "/displayfile?filename=" + filename;
	}
	
	let pText = getOrgName(filename);
	
	let btnDataFilename = filename;
	
	let str = `
		<div>
			<a href="${aHref}" target="_blank">
				<img src="${imgSrc}" alt="업로드한 파일의 썸네일">
			</a>
			<div>
				<p>${pText}</p>
			</div>
		</div>
	`;
	
	return str;
}

     function makeUploadItemTag2(filename){
    
       let imgSrc = '';
                  if (isImg(filename)) {
                     imgSrc = "/displayfile?filename=" + filename;
                  } else {
                     imgSrc = "/resources/img/일반파일.png";
                  }
                  
                  let aHref = '';
                  if (isImg(filename)) {
                     aHref = "/displayfile?filename=" + getImgFilePath(filename);
                  } else {
                     aHref = "/displayfile?filename=" + filename;
                  }
                  
                  let pText = getOrgName(filename);
                  let btnDataFilename = filename;
   
      let str = `<div class="col mb-4">
     <div class="card filename border-primary text-center" style="width: 18rem;">
  <a href="${aHref}" target="_blank"><img src="${imgSrc}" class="" alt="업로드한 파일의 썸네일"></a>
  <div class="card-body">
    <p class="card-text">${pText}</p>
    <a href="#" data-filename="${btnDataFilename}" class="btn btn-secondary btn_del_item">삭제</a>
  </div>
</div>
</div>
      `;
      
      
      
   return str;
}

function isImg(filename) {
	let idx = filename.lastIndexOf(".") + 1;
	
	let formatName = filename.substring(idx).toLowerCase();
	
	if(formatName == "png" || formatName == "gif" || formatName == "jpg" || formatName == "jpeg") {
		return true;
	}else {
		return false;
	}
}

function getImgFilePath(filename) {
	let prefix = filename.substring(0, 12);
	let suffix = filename.substring(14);
	
	return prefix + suffix;
}

function getOrgName(filename) {
	let orgName = "";
	
	let idx = -1;
	
	if(isImg(filename)) {
		idx = filename.indexOf("_", 14) + 1;
	}else {
		idx = filename.indexOf("_") + 1;
	}
	
	orgName = filename.substring(idx);
	
	return orgName;
}


function getAllReply2(qno, el) {
	let tagStr = "";

	$.getJSON("/replies/" + qno + "/all", function(result) {
		for (let i = 0; i < result.length; i++) {
			let item = result[i];
			let str = makeItemTag(item);
			tagStr += str;
		}

		el.html(tagStr);
	});
}

function getPagingReply(qno, el, curPage) {
	el.html("");

	$.getJSON("/replies/" + qno + "/"+curPage, function(result) {
		for (let i = 0; i < result.length; i++) {
			let item = result[i];
			let str = makeItemTag(item);
			el.append(str);
		}
	});
}


function getAllReply(qno, el) {
	el.html("");

	$.getJSON("/replies/" + qno + "/all", function(result) {
		for (let i = 0; i < result.length; i++) {
			let item = result[i];
			let str = makeItemTag(item);
			el.append(str);
		}
	});
}

function makeItemTagForOwner(item) {
	let str = `
	<div class="card item my-5">
  <div class="card-header">
  
  <span hidden="hidden">댓글번호: ${item.rno}</span>
  <span class="float-right">최종 수정일: ${item.updateDay}</span>
  </div>
  <div class="card-body">
    <h5 class="card-title">${item.replyer}</h5>
    <p class="card-text">${item.replyText}</p>
    <button data-rno="${item.rno}" id="item_btn_update_submit" type="button" class="btn btn-primary item_btn_update" data-toggle="modal"
      data-target="#exampleModal">수정</button>
    <a data-rno="${item.rno}" href="#" class="btn btn-secondary item_btn_delete">삭제</a>
  </div>
</div>
	`;

	return str;

}

function makeItemTag(item) {
	let str = `
	<div class="card item my-5">
  <div class="card-header">
    <span hidden="hidden">댓글번호: ${item.rno}</span>
  <span class="float-right">최종 수정일: ${item.updateDay}</span>
  </div>
  <div class="card-body">
    <h5 class="card-title">${item.replyer}</h5>
    <p class="card-text">${item.replyText}</p>
   <button data-rno="${item.rno}" id="item_btn_update_submit" type="button" class="btn btn-primary item_btn_update" data-toggle="modal"
      data-target="#exampleModal">수정</button>
    <a data-rno="${item.rno}" href="#" class="btn btn-secondary item_btn_delete">삭제</a>
  </div>
</div>
	`;

	return str;

}

