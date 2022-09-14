CREATE TABLE tbl_admin(
	adminId VARCHAR2(15),
	aName VARCHAR2(15) NOT NULL,
	aNickname VARCHAR2(20) UNIQUE NOT NULL,
	aPassword VARCHAR2(30) NOT NULL,
	aBirth DATE,
	aPostnumber VARCHAR2(10) NOT NULL,
	aAddress VARCHAR2(200) NOT NULL,
	adetailAddress VARCHAR2(100) NOT NULL,
	aPhone VARCHAR2(15) UNIQUE NOT NULL,
	aEmail VARCHAR2(50) UNIQUE NOT NULL,
	aSigndate DATE DEFAULT SYSDATE,
	
	CONSTRAINT pk_admin_adminId PRIMARY KEY(adminId)
)

SELECT * FROM tbl_admin

insert into tbl_admin (adminId, aName, aNickname, aPassword, aBirth, aPostnumber, aAddress, adetailAddress, aPhone, aEmail, aSigndate)
values ('admin', '관리자', '관리자', '2222', '2022-05-26', 12083, '서울시 중랑구 상봉로' , '201동 111호', '010-5178-9874', 'admin@naver.com', sysdate)