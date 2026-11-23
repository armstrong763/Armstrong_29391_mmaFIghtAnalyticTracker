ALTER SESSION SET CONTAINER = C_29391_ARMSTRONG_MMAFIGHT_DB;

-- View for coach
CREATE OR REPLACE VIEW v_fighter_fights AS
SELECT f.full_name, fi.fight_id, fi.purse_amount, fi.status
FROM FIGHTER f JOIN FIGHT fi ON f.fighter_id = fi.fighter_id;

-- Security: member can only see view, not tables
GRANT SELECT ON v_fighter_fights TO mmafight_fighter;
GRANT SELECT, INSERT, UPDATE ON FIGHT TO mmafight_coach;
GRANT SELECT, INSERT, UPDATE ON FIGHT TO mmafight_fighter;

-- Audit
AUDIT SELECT ON FIGHTER BY ACCESS;