# Dataset Card - MMA Fights in Kigali

## 1. Overview
- **Dataset:** MMA Fight Records - Kigali, Rwanda
- **Records:** 612 fights
- **Columns:** 21 columns
- **Format:** CSV / Excel - originally one wide flat file
- **Date Collected:** November 2026
- **Date Range in Data:** 2022-04-03 to 2024-07-28

## 2. Source
- **Source:** Simulated / class dataset compiled for INSY 8311 Capstone
- **Licence:** For academic use only - INSY 8311 Phase II
- **One record represents:** One MMA fight - one event, two fighters, one winner, one result

## 3. Fields
Fight_ID, Event_ID, Event_Date, Event_Name, Venue, District, Promoter,
Fighter1_ID, Fighter1_Wins, Fighter1_Losses, Fighter1_Gym, Fighter1_Coach,
Fighter2_ID, Fighter2_Wins, Fighter2_Losses, Fighter2_Gym, Fighter2_Coach,
Weight_Class, Result_Type, Rounds, Winner_ID, Prize_Money, Result_Summary

## 4. Anonymisation
- No real names, phone numbers, or ID numbers used
- Fighters anonymised as F001 - F207
- Coaches anonymised as Coach A, B, C, D
- Gyms use generic names: Lion Gym, Eagle Gym, Tiger Gym, Shark Gym

## 5. Data Quality Report (Task 2 - Counts Only, NOT Fixed)
- Total records: 612
- Missing dates: 0
- Missing values: 0
- Duplicate rows: 0 (to be verified with COUNTIF in Excel)
- District spellings: 7 distinct values for 4 real districts
  (Kigali, KIGALI, Kigali City, Gasabo, Kicukiro, KICUKIRO, Nyarugenge)
- Prices stored as text: 612 (all values like $50.00, $75.00, $25.00 - include $ sign)
- Dates stored as text: 612 (need DATE conversion in Phase IV)
- Venue spellings: Consistent (BK Arena, Kigali Arena, Kigali Convention Centre)

## 6. Notes for Phase IV Cleaning
- Standardise District: KIGALI -> Kigali, Kigali City -> Kigali, KICUKIRO -> Kicukiro
- Convert Prize_Money: Text ($50.00) -> NUMBER (50.00)
- Convert Event_Date: Text -> DATE
