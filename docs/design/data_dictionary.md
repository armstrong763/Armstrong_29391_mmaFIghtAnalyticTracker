# Data Dictionary - MMA Fight Analytic Tracker
## Phase II - Logical Design (No Oracle types yet)

### Task 5: Field Mapping - Raw -> 3NF

| Raw Field | Target Table.Column | Action | Type Conversion for Phase IV |
| --- | --- | --- | --- |
| Fight_ID | FIGHT.Fight_ID | Keep | Text -> NUMBER |
| Event_ID | EVENT.Event_ID | Keep | Keep as TEXT |
| Event_Date | EVENT.Event_Date | Keep | Text -> DATE |
| Event_Name | EVENT.Event_Name | Keep | None |
| Venue | EVENT.Venue | Keep | None |
| District | EVENT.District | Keep | Standardise: KIGALI -> Kigali, Kigali City -> Kigali |
| Promoter | EVENT.Promoter | Keep | None |
| Fighter1_ID / Fighter2_ID | FIGHT_PARTICIPATION.Fighter_ID | Split into 2 rows | Keep as TEXT |
| Fighter1_Wins / Fighter2_Wins | FIGHTER.Wins | Move to FIGHTER | Text -> NUMBER |
| Fighter1_Losses / Fighter2_Losses | FIGHTER.Losses | Move to FIGHTER | Text -> NUMBER |
| Fighter1_Gym / Fighter2_Gym | GYM.Gym_Name + FIGHTER.Gym_ID | Move to GYM | None |
| Fighter1_Coach / Fighter2_Coach | COACH.Coach_Name | Move to COACH | None |
| Weight_Class | FIGHT.Weight_Class | Keep | None |
| Result_Type | FIGHT.Result_Type | Keep | None |
| Rounds | FIGHT.Rounds | Keep | Text -> NUMBER |
| Winner_ID | FIGHT.Winner_ID | Keep | Keep as TEXT |
| Prize_Money | FIGHT.Prize_Money | Keep | Text ($50.00) -> NUMBER (50.00) |
| Result_Summary | DROPPED | Dropped - derived from Result_Type + Winner_ID | - |

### Task 6: Data Dictionary

#### 1. EVENT - PK: Event_ID
| Column | Meaning | Required | Unique |
| --- | --- | --- | --- |
| Event_ID | Unique ID for event | Yes | Yes |
| Event_Name | Name of event, e.g. Kigali Fight Night 1 | Yes | No |
| Event_Date | Date event happened | Yes | No |
| Venue | Where event happened | Yes | No |
| District | District of venue | Yes | No |
| Promoter | Who organised event | Yes | No |

#### 2. FIGHTER - PK: Fighter_ID
| Column | Meaning | Required | Unique |
| --- | --- | --- | --- |
| Fighter_ID | Unique ID for fighter, e.g. F001 | Yes | Yes |
| Wins | Total wins before fight | Yes | No |
| Losses | Total losses before fight | Yes | No |
| Gym_ID | Gym fighter belongs to - FK to GYM | Yes | No |
| Coach_ID | Coach of fighter - FK to COACH | Yes | No |

#### 3. GYM - PK: Gym_ID
| Column | Meaning | Required | Unique |
| --- | --- | --- | --- |
| Gym_ID | Unique ID for gym | Yes | Yes |
| Gym_Name | Name, e.g. Lion Gym | Yes | Yes |
| District | District where gym is located | Yes | No |

#### 4. COACH - PK: Coach_ID
| Column | Meaning | Required | Unique |
| --- | --- | --- | --- |
| Coach_ID | Unique ID for coach | Yes | Yes |
| Coach_Name | Anonymised name, e.g. Coach A | Yes | Yes |
| Gym_ID | Gym coach works for - FK to GYM | Yes | No |

#### 5. FIGHT - PK: Fight_ID
| Column | Meaning | Required | Unique |
| --- | --- | --- | --- |
| Fight_ID | Unique ID for fight | Yes | Yes |
| Event_ID | Event fight belongs to - FK to EVENT | Yes | No |
| Weight_Class | e.g. Lightweight, Featherweight | Yes | No |
| Result_Type | KO, Decision, Submission, Draw | Yes | No |
| Rounds | Number of rounds fought | Yes | No |
| Winner_ID | Winner - FK to FIGHTER, can be NULL if Draw | No | No |
| Prize_Money | Prize for winner | Yes | No |

#### 6. FIGHT_PARTICIPATION - PK: (Fight_ID + Fighter_ID)
| Column | Meaning | Required | Unique |
| --- | --- | --- | --- |
| Fight_ID | Fight - FK to FIGHT | Yes | No - part of PK |
| Fighter_ID | Fighter in fight - FK to FIGHTER | Yes | No - part of PK |
| Is_Winner | Yes/No - did this fighter win? | Yes | No |

### Relationships (Crow's Foot)
- EVENT 1 ---< FIGHT (One event has many fights, each fight belongs to one event)
- GYM 1 ---< FIGHTER (One gym has many fighters)
- GYM 1 ---< COACH (One gym has many coaches)
- FIGHTER 1 ---< FIGHT_PARTICIPATION >--- 1 FIGHT (Many-to-Many resolved via junction)
- FIGHTER 1 ---< FIGHT (One fighter can win many fights - Winner_ID)
