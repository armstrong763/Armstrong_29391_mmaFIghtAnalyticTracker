ALTER SESSION SET CONTAINER = C_29391_ARMSTRONG_MMAFIGHT_DB;

-- Roles
CREATE ROLE mmafight_admin_role;
CREATE ROLE mmafight_coach_role;
CREATE ROLE mmafight_fighter_role;

-- Users
CREATE USER ARMSTRONG_APP IDENTIFIED BY Armstrong2025
DEFAULT TABLESPACE mmafight_data
TEMPORARY TABLESPACE mmafight_temp;

CREATE USER mmafight_coach IDENTIFIED BY Coach2025
DEFAULT TABLESPACE mmafight_data
TEMPORARY TABLESPACE mmafight_temp;

CREATE USER mmafight_fighter IDENTIFIED BY Fighter2025
DEFAULT TABLESPACE mmafight_data
TEMPORARY TABLESPACE mmafight_temp;

-- Grants
GRANT CONNECT, RESOURCE TO ARMSTRONG_APP;
GRANT mmafight_admin_role TO ARMSTRONG_APP;
GRANT mmafight_coach_role TO mmafight_coach;
GRANT mmafight_fighter_role TO mmafight_fighter;

GRANT CREATE SESSION TO mmafight_coach, mmafight_fighter;