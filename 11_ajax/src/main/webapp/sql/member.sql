DROP TABLE MEMBER_T;
CREATE TABLE MEMBER_T(
    MEMBER_NO NUMBER NOT NULL,
    EMAIL     VARCHAR2(100 BYTE) NOT NULL UNIQUE,
    NAME      VARCHAR2(100 BYTE),
    GENDER    VARCHAR2(1 BYTE),
    ADDRESS   VARCHAR2(100 BYTE),
    CONSTRAINT PK_MEMBER PRIMARY KEY(MEMBER_NO)
);

DROP SEQUENCE MEMBER_SEQ;
CREATE SEQUENCE MEMBER_SEQ NOCACHE;