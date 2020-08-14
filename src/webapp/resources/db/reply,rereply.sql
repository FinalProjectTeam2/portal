--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-06-2020   
--------------------------------------------------------'
   CREATE SEQUENCE  "PORTAL"."REREPLY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table REPLY
--------------------------------------------------------

  CREATE TABLE "REPLY" ("REPLY_NO" NUMBER, "OFFICIAL_NO" VARCHAR2(100), "REG_DATE" DATE DEFAULT sysdate, "CONTENTS" CLOB, "DEL_FLAG" CHAR(1) DEFAULT 'N', "POST_NO" NUMBER)
REM INSERTING into REPLY
SET DEFINE OFF;
Insert into REPLY (REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG,POST_NO) values (reply_seq.nextval,'202020010001',to_date('20/08/06','RR/MM/DD'),'N',16);
--------------------------------------------------------
--  DDL for Index PK_REPLY
--------------------------------------------------------

  CREATE UNIQUE INDEX "PK_REPLY" ON "REPLY" ("REPLY_NO")
--------------------------------------------------------
--  Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY ("REPLY_NO") ENABLE
  ALTER TABLE "REPLY" MODIFY ("OFFICIAL_NO" NOT NULL ENABLE)
  ALTER TABLE "REPLY" MODIFY ("REPLY_NO" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table REPLY
--------------------------------------------------------

  ALTER TABLE "REPLY" ADD CONSTRAINT "REPLY_FK1" FOREIGN KEY ("POST_NO") REFERENCES "POSTS" ("POST_NO") ON DELETE CASCADE ENABLE

--------------------------------------------------------
--  파일이 생성됨 - 목요일-8월-06-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table REREPLY
--------------------------------------------------------

  CREATE TABLE "REREPLY" ("REREPLY_NO" NUMBER, "REPLY_NO" NUMBER, "OFFICIAL_NO" VARCHAR2(100), "REG_DATE" DATE DEFAULT sysdate, "CONTENTS" CLOB, "DEL_FLAG" CHAR(1) DEFAULT 'N')
REM INSERTING into REREPLY
SET DEFINE OFF;
Insert into REREPLY (REREPLY_NO,REPLY_NO,OFFICIAL_NO,REG_DATE,DEL_FLAG) values (1,2,'202020010001',to_date('20/08/06','RR/MM/DD'),'N');
--------------------------------------------------------
--  DDL for Index REREPLY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "REREPLY_PK" ON "REREPLY" ("REREPLY_NO")
--------------------------------------------------------
--  Constraints for Table REREPLY
--------------------------------------------------------

  ALTER TABLE "REREPLY" MODIFY ("REPLY_NO" NOT NULL ENABLE)
  ALTER TABLE "REREPLY" ADD CONSTRAINT "REREPLY_PK" PRIMARY KEY ("REREPLY_NO") ENABLE
  ALTER TABLE "REREPLY" MODIFY ("REREPLY_NO" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table REREPLY
--------------------------------------------------------

  ALTER TABLE "REREPLY" ADD CONSTRAINT "REREPLY_FK1" FOREIGN KEY ("REPLY_NO") REFERENCES "REPLY" ("REPLY_NO") ON DELETE CASCADE ENABLE
