/**
 * 
 */


function star(parentTag) {

   var msg = `
<i data-idx="0" data-val="1" class="bi bi-star-fill star"></i>
<i data-idx="1" data-val="2" class="bi bi-star-fill star"></i>
<i data-idx="2" data-val="3" class="bi bi-star-fill star"></i>
<i data-idx="3" data-val="4" class="bi bi-star-fill star"></i>
<i data-idx="4" data-val="5" class="bi bi-star-fill star"></i>
`;



   parentTag.html(msg);

}

 
function test2(result, filename, filekey){
   if(!isImg(filename)){
      result = "/resources/img/일반파일.png";
   }
   
   
   let str = `
<div class="col mb-4">
   <div class="card filename border-primary text-center">
      <div>
         <img src="${result}" width="500px" height="500px">
      </div>
      <div class="card-body">
          <p class="card-text">${filename}</p>
          <a href="#" data-filekey="${filekey}" data-filename="new" class="btn btn-danger btn_del_item">삭제</a>
      </div>
   </div>
</div>
   `;
   
   return str;
} 

function test(result, filename){
   if(!isImg(filename)){
      result = "/resources/img/일반파일.png";
   }
   
   
   let str = `
<div class="col mb-4">
   <div class="card filename border-primary text-center">
      <div>
         <img src="${result}" width="200px" height="200px">
      </div>
      <div class="card-body">
          <p class="card-text">${filename}</p>
      </div>
   </div>
</div>
   `;
   
   return str;
} 
 

 
function getAllUploadForUpdateUI(pno, uploadedItems){
   $.getJSON("/cart/"+pno+"/uploadall", function(data){
      for(let i=0;i<data.length;i++){
         let filename = data[i];
         let str = makeUploadItemTag2(filename);
         uploadedItems.append(str);
      }
      
   });
} 
 
 
 
function getAllUpload(pno, uploadedItems){
   $.getJSON("/cart/"+pno+"/uploadall", function(data){
      for(let i=0;i<data.length;i++){
         let filename = data[i];
         let str = makeUploadItemTagForRead(filename);
         uploadedItems.append(str);
      }
      
   });
}

 
function makeUploadItemTagForRead(filename){
   
   let imgSrc = "";
   if (isImg(filename)) {
      imgSrc = "/displayfile?filename=" + filename;
   } else {
      imgSrc = "/resources/img/일반파일.png";
   }

   let aHref = "";
   if (isImg(filename)) {
      aHref = "/displayfile?filename=" + getImgFilePath(filename);
   } else {
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
   
   let imgSrc = "";
   if (isImg(filename)) {
      imgSrc = "/displayfile?filename=" + filename;
   } else {
      imgSrc = "/resources/img/일반파일.png";
   }

   let aHref = "";
   if (isImg(filename)) {
      aHref = "/displayfile?filename=" + getImgFilePath(filename);
   } else {
      aHref = "/displayfile?filename=" + filename;
   }
   let pText = getOrgName(filename);
   let btnDataFilename = filename;
   
   let str = `<div class="col mb-4">
       <div class="card filename border-primary text-center" style="width: 30rem;">
  <a href="${aHref}" target="_blank"><img src="${imgSrc}" class="" alt="업로드한 파일의 썸네일"></a>
  <div class="card-body">
    <p class="card-text">${pText}</p>
    <a href="#" data-filename="${btnDataFilename}" class="btn btn-danger btn_del_item">삭제</a>
  </div>
</div>
</div>
   `;
   
   return str;
} 
 
 
function makeUploadItemTag(imgSrc, aHref, pText, btnDataFilename){
   let str = `<div class="col mb-4">
       <div class="card filename border-primary text-center" style="width: 18rem;">
  <a href="${aHref}" target="_blank"><img src="${imgSrc}" class="" alt="업로드한 파일의 썸네일"></a>
  <div class="card-body">
    <p class="card-text">${pText}</p>
    <a href="#" data-filename="${btnDataFilename}" class="btn btn-danger btn_del_item">삭제</a>
  </div>
</div>
</div>
   `;
   
   return str;
} 
 

function getOrgName(filename) {
   let orgName = "";
   let idx = -1;

   if (isImg(filename)) {
      idx = filename.indexOf("_", 14) + 1;
   } else {
      idx = filename.indexOf("_") + 1;
   }

   orgName = filename.substring(idx);

   return orgName;
}


function getImgFilePath(filename) {
   let prefix = filename.substring(0, 12);
   let suffix = filename.substring(14);
   return prefix + suffix;
}


function isImg(filename) {
   let idx = filename.lastIndexOf(".") + 1;
   let formatName = filename.substring(idx).toLowerCase();
   if (formatName == "png" || formatName == "gif"
      || formatName == "jpg" || formatName == "jpeg") {
      return true;
   } else {
      return false;
   }
}	

function makeItemTag(item) {
	let str = `
	<div class="card item my-5">
  <div class="card-header">
    <span>댓글번호: ${item.rRno}</span> <span class="float-right"> 등록일: ${item.rRegDate}</span>
  </div>
  <div class="card-body">
    <h5 class="card-title">${item.userId}</h5>
    <p class="card-text">${item.rComment}</p>
  </div>
</div>
	`;

	return str;

}




