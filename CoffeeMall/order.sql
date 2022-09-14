CREATE TABLE tbl_order(
orderId VARCHAR2(50),
receiver VARCHAR2(50) NOT NULL,
userId VARCHAR2(50),
uPostnumber VARCHAR2(10) NOT NULL,
uAddress VARCHAR2(200) NOT NULL,
udetailAddress VARCHAR2(100) NOT NULL,
orderState VARCHAR2(30) NOT NULL,
deliveryCost NUMBER NOT NULL,
orderDate DATE DEFAULT SYSDATE,
CONSTRAINT pk_order_orderId PRIMARY KEY (orderId),
CONSTRAINT fk_order_userId FOREIGN KEY (userId) REFERENCES tbl_user(userId)
);

SELECT * FROM tbl_order;


select * from tbl_order natural join tbl_orderItem

select * from tbl_order natural join product 

select * from tbl_order natural join tbl_user

select * from tbl_user natural join (select * from product natural join (select * from tbl_order natural join tbl_orderItem)); 

create or replace view v_order_all_join
as
select * from tbl_user natural join 
(select * from product natural join 
(select * from tbl_order natural join tbl_orderItem)) 
order by orderitem asc, oid asc, pno asc; 

create or replace view v_order_all_join
as
select * from tbl_user natural join 
(select * from product natural join 
(select * from tbl_order natural join tbl_orderItem)) 
order by orderitemId asc, orderId asc, pno asc; 

select * from v_order_all_join

SELECT SUM(cartCount) FROM v_order_all_join where pno = 3


SELECT * FROM v_order_all_join

SELECT COUNT (pno) FROM v_order_all_join

SELECT pno, pName, cartCount, pPrice FROM v_order_all_join where pno = 3

s
