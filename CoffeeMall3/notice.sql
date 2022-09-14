CREATE TABLE tbl_notice(
	nno 		 NUMBER,
    userId       VARCHAR2(30) NOT NULL,
    nTitle       VARCHAR2(300) NOT NULL,
    nContent     VARCHAR2(4000) NOT NULL,
    nWritedate   DATE DEFAULT SYSDATE,
 	nUpdatedate  DATE DEFAULT SYSDATE,
 	readCnt NUMBER DEFAULT 0,
 	CONSTRAINT pk_notice_nno PRIMARY KEY(nno)
)

CREATE SEQUENCE seq_tbl_notice_nno;

select * from user_sequences
SELECT * FROM notice_upload;

drop sequence seq_notice_nno;
drop table tbl_notice;
drop table notice_upload

ALTER TABLE tbl_notice RENAME column userId to adminId;

ALTER TABLE tbl_notice MODIFY (adminId VARCHAR2(15)); 

DELETE FROM tbl_notice WHERE nno = 2

ALTER TABLE tbl_notice ADD CONSTRAINT fk_notice_adminId FOREIGN KEY (adminId) REFERENCES tbl_admin(adminId)