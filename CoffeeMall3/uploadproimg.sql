create table pro_upload(
filename VARCHAR2(300) not null,
pno NUMBER,
CONSTRAINT fk_upload_pno foreign key(pno) references product(pno)
on delete cascade
)

drop table pro_upload

drop sequence pro_upload_pno

select*from pro_upload
drop table tbl_order
SELECT * FROM tabs; 
SELECT * FROM ALL_OBJECTS WHERE OBJECT_TYPE = 'TABLE';
SELECT pno FROM product
