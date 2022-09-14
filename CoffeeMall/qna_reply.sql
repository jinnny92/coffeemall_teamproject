CREATE TABLE tbl_qna_reply(
	rno NUMBER,
	qno NUMBER,
	replyText VARCHAR2(500),
	CONSTRAINT pk_qna_reply_rno PRIMARY KEY(rno),
	CONSTRAINT fk_qna_reply_qno FOREIGN KEY(qno) REFERENCES tbl_qna(qno)
)

DROP table tbl_qna_reply

insert into TBL_QNA_REPLY(qno, replyText, rno) values (seq_qna_reply_rno.NEXT,,seq_reply_rno.NEXTVAL)

SELECT * FROM tbl_qna_reply

alter table tbl_qna_reply modify replyText not null

DELETE FROM tbl_qna_reply

ALTER TABLE tbl_qna_reply ADD (rno NUMBER)

alter table tbl_qna_reply modify rno not null

ALTER TABLE tbl_qna_reply ADD CONSTRAINT pk_qna_reply_rno PRIMARY KEY(rno)


CREATE SEQUENCE seq_qna_reply_rno
