-- สร้าง Sequence สำหรับ mealcode
CREATE SEQUENCE meal_seq START WITH 1 INCREMENT BY 1;

-- สร้าง Sequence สำหรับ mealdetailcode
CREATE SEQUENCE mealdetail_seq START WITH 1 INCREMENT BY 1; 

-- Run ทีละคำสั่ง โดย Trigger ใน DBeaver ไม่ต้องมี /

-- Trigger สำหรับ mealcode
CREATE OR REPLACE TRIGGER trg_meal_insert
BEFORE INSERT ON meal
FOR EACH ROW
BEGIN
  SELECT meal_seq.NEXTVAL INTO :NEW.mealcode FROM DUAL;
END;
/

-- Trigger สำหรับ mealdetailcode
CREATE OR REPLACE TRIGGER trg_mealdetail_insert
BEFORE INSERT ON mealdetail
FOR EACH ROW
BEGIN
  SELECT mealdetail_seq.NEXTVAL INTO :NEW.mealdetailcode FROM DUAL;
END;
/
