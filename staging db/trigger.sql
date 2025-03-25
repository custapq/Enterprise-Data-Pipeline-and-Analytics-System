CREATE OR REPLACE TRIGGER trg_check_gender
BEFORE INSERT ON stAppUser
FOR EACH ROW
BEGIN
   -- แปลงค่า gender เป็นตัวพิมพ์ใหญ่
   :NEW.gender := UPPER(:NEW.gender);

   -- ตรวจสอบค่า gender
   IF :NEW.gender IN ('M', 'ช') THEN
      :NEW.gender := 'M'; -- กำหนดค่าเป็น 'M'
   ELSIF :NEW.gender IN ('F', 'ญ') THEN
      :NEW.gender := 'F'; -- กำหนดค่าเป็น 'F'
   ELSE
      -- หากค่า gender ไม่ถูกต้อง ให้ยกเลิกการบันทึก
      RAISE_APPLICATION_ERROR(-20001, 'Invalid gender value. Please use M/ช for male or F/ญ for female.');
   END IF;
END;
/