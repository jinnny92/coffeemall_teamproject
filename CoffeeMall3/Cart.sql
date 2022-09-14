CREATE TABLE tbl_cart(
cartId NUMBER,
userId VARCHAR2(15),
pno NUMBER NOT NULL,
cartCount NUMBER NOT NULL,
CONSTRAINT pk_cart_cartId PRIMARY KEY (cartId),
CONSTRAINT fk_cart_userId FOREIGN KEY(userId) REFERENCES tbl_user(userId) ON DELETE CASCADE,
CONSTRAINT fk_cart_pno FOREIGN KEY(pno) REFERENCES product(pno) ON DELETE CASCADE
)

CREATE SEQUENCE seq_cartId;

SELECT * FROM tbl_cart;
SELECT * FROM tabs


ALTER TABLE tbl_cart add CONSTRAINT fk_cart_userId FOREIGN KEY(userId) REFERENCES tbl_user(userId) ON DELETE CASCADE

ALTER TABLE tbl_cart ADD UNIQUE (userId, pno);


DROP TABLE tbl_cart;

SELECT * FROM ALL_CONSTRAINTS WHERE TABLE_NAME = 'tbl_cart';

SELECT * FROM tbl_user;
