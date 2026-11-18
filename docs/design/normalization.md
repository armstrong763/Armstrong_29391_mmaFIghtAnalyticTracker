# Normalization - MMA Fight Analytic Tracker
## From UNF to 3NF

### Raw Example (UNF)
One row holds repeating groups - Fighter 1 and Fighter 2 in same row.

| Fight_ID | Event_Name | Fighter1 | Fighter2 | Result |
| --- | --- | --- | --- | --- |
| 1000 | Kigali Fight Night 1 | F001 (Lion Gym) | F002 (Eagle Gym) | F001 wins by KO |
| 1001 | Kigali Fight Night 1 | F003 (Tiger Gym) | F004 (Shark Gym) | F004 wins by Decision |
| 1002 | Kigali Fight Night 1 | F005 (Lion Gym) | F006 (Eagle Gym) | Draw |

**Problem:** Repeating group - two fighters, two gyms, two coaches in one row.

### 1NF - Remove Repeating Group
One row per fighter per fight. Every column holds a single value.
Key: (Fight_ID, Fighter_ID)

| Fight_ID | Fighter_ID | Gym | Coach | Is_Winner |
| --- | --- | --- | --- | --- |
| 1000 | F001 | Lion Gym | Coach A | Yes |
| 1000 | F002 | Eagle Gym | Coach B | No |
| 1001 | F003 | Tiger Gym | Coach C | No |
| 1001 | F004 | Shark Gym | Coach D | Yes |

**Dependency removed:** Repeating group - split fighters into separate rows.

### 2NF - Remove Partial Dependencies
Event details depend only on Fight_ID, not on (Fight_ID, Fighter_ID), so they move out.

**FIGHT Table:**
| Fight_ID | Event_ID | Weight_Class | Result_Type | Rounds | Winner_ID |
| --- | --- | --- | --- | --- | --- |
| 1000 | E001 | Lightweight | KO | 3 | F001 |
| 1001 | E001 | Featherweight | Decision | 5 | F004 |

**FIGHT_PARTICIPATION (Junction Table):**
| Fight_ID | Fighter_ID | Is_Winner |
| --- | --- | --- |
| 1000 | F001 | Yes |
| 1000 | F002 | No |

**Dependency removed:** Partial dependency - Event_Date, Event_Name depend only on Event_ID / Fight_ID, not on the full composite key.

### 3NF - Remove Transitive Dependencies
District depends on Venue/Event, not on Fight. Gym details depend on Gym, not on Fighter. Coach depends on Gym.

**Final 3NF Tables:**

**1. EVENT (Event_ID PK)**
Event_ID, Event_Name, Event_Date, Venue, District, Promoter

**2. FIGHTER (Fighter_ID PK)**
Fighter_ID, Wins, Losses, Gym_ID (FK), Coach_ID (FK)

**3. GYM (Gym_ID PK)**
Gym_ID, Gym_Name, District

**4. COACH (Coach_ID PK)**
Coach_ID, Coach_Name, Gym_ID (FK)

**5. FIGHT (Fight_ID PK)**
Fight_ID, Event_ID (FK), Weight_Class, Result_Type, Rounds, Winner_ID (FK), Prize_Money

**6. FIGHT_PARTICIPATION (Fight_ID + Fighter_ID PK)**
Fight_ID (FK), Fighter_ID (FK), Is_Winner

**Dependency removed:** Transitive dependency - District depends on Event -> moved to EVENT, Gym_Name depends on Gym_ID -> moved to GYM, Coach depends on Gym -> moved to COACH.
