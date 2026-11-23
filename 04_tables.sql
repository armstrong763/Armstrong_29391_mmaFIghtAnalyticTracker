ALTER SESSION SET CONTAINER = C_29391_ARMSTRONG_MMAFIGHT_DB;

CREATE TABLE FIGHTER (
  fighter_id NUMBER PRIMARY KEY,
  full_name VARCHAR2(100) NOT NULL,
  national_id VARCHAR2(20) UNIQUE NOT NULL,
  phone VARCHAR2(20),
  join_date DATE DEFAULT SYSDATE
) TABLESPACE mmafight_data;

CREATE TABLE FIGHT (
  fight_id NUMBER PRIMARY KEY,
  fighter_id NUMBER REFERENCES FIGHTER(fighter_id),
  opponent_name VARCHAR2(100) NOT NULL,
  weight_class VARCHAR2(20),
  purse_amount NUMBER(12,2) NOT NULL,
  status VARCHAR2(20) DEFAULT 'PENDING',
  fight_date DATE DEFAULT SYSDATE
) TABLESPACE mmafight_data;

CREATE TABLE FIGHT_PAYMENT (
  payment_id NUMBER PRIMARY KEY,
  fight_id NUMBER REFERENCES FIGHT(fight_id),
  amount_paid NUMBER(12,2) NOT NULL,
  payment_date DATE DEFAULT SYSDATE
) TABLESPACE mmafight_data;

CREATE INDEX idx_fight_fighter ON FIGHT(fighter_id) TABLESPACE mmafight_idx;
CREATE INDEX idx_pay_fight ON FIGHT_PAYMENT(fight_id) TABLESPACE mmafight_idx;