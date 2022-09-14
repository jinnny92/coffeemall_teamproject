CREATE TABLE tbl_orderItem(
orderItemId NUMBER,
orderId VARCHAR2(50),
pno NUMBER,
cartCount NUMBER NOT NULL,
pPrice NUMBER NOT NULL,
CONSTRAINT fk_orderItem_orderId FOREIGN KEY (orderId) REFERENCES tbl_order(orderId),
CONSTRAINT fk_orderItem_pno FOREIGN KEY (pno) REFERENCES product(pno),
CONSTRAINT pk_orderItem_orderItemId PRIMARY KEY (orderItemId)
)

CREATE SEQUENCE seq_orderItemId;

SELECT * FROM tbl_orderItem;


======================================
=========================================

DROP SEQUENCE seq_orderItemId;

DROP TABLE tbl_orderItem;

ALTER TABLE tbl_orderItem
RENAME COLUMN pCount TO cartCount;


ALTER TABLE tbl_orderItem
DROP COLUMN savePoint;

savePoint NUMBER NOT NULL,
