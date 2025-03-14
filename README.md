# 🍽️ Food Mate

A meal recommendation and tracking application that considers users' health conditions and food allergies.

## 🔍 Overview

**Food Mate** is an application that helps users plan and track their meals while considering health limitations such as chronic diseases and food allergies. The system recommends appropriate food based on each user's specific needs and stores meal history for long-term health analysis and improvement.

## 📊 Data Architecture

### Data Warehouse Bus Matrix

- [Google Sheets - Data Warehouse Bus Matrix](https://docs.google.com/spreadsheets/d/1D9HIfxfLVy_TH8LxKHwQ4O83EhyN7ZZI-uCaq3S6wbU/edit?gid=0#gid=0)

### Data Warehouse ERD

- [Draw.io ER Diagram](https://app.diagrams.net/#G19fcVYQdGa4y4rXgAca5Z0mC1BgIomxGA#%7B%22pageId%22%3A%2218Qqate74BUYc48z-ENa%22%7D)

### Food Nutrients

- [Google Sheets - Food Nutrients](https://docs.google.com/spreadsheets/d/1ke_CvFSWOVdKGk7DgUq8cFjlxrq4FPjf2pkb8g4lOas/edit?usp=sharing)

## 💻 Usage

### Database Operations

#### Reset all tables

Execute the following PL/SQL block to clear all tables:

```sql
BEGIN
    -- ลบ TRIGGER
    FOR cur IN (SELECT trigger_name FROM user_triggers) LOOP
        EXECUTE IMMEDIATE 'DROP TRIGGER ' || cur.trigger_name;
    END LOOP;

    -- ลบ SEQUENCE
    FOR cur IN (SELECT sequence_name FROM user_sequences) LOOP
        EXECUTE IMMEDIATE 'DROP SEQUENCE ' || cur.sequence_name;
    END LOOP;

    -- ลบ TABLE
    FOR cur IN (SELECT table_name FROM user_tables) LOOP
        EXECUTE IMMEDIATE 'DROP TABLE ' || cur.table_name || ' CASCADE CONSTRAINTS PURGE';
    END LOOP;
    
    -- ลบ VIEW
    FOR cur IN (SELECT view_name FROM user_views) LOOP
        EXECUTE IMMEDIATE 'DROP VIEW ' || cur.view_name;
    END LOOP;
END;
/

```
####

```sql
-- ปิดการตรวจสอบ Foreign Key ก่อนลบตาราง (เพื่อหลีกเลี่ยงข้อผิดพลาด)
SET FOREIGN_KEY_CHECKS = 0;

-- ลบตารางทั้งหมดตามลำดับความสัมพันธ์
DROP TABLE IF EXISTS mealdetail;
DROP TABLE IF EXISTS meal;
DROP TABLE IF EXISTS usercondition;
DROP TABLE IF EXISTS favoritefood;
DROP TABLE IF EXISTS foodallergy;
DROP TABLE IF EXISTS appuser;
DROP TABLE IF EXISTS exercise;
DROP TABLE IF EXISTS chronicdisease;
DROP TABLE IF EXISTS foodcategorydetail;
DROP TABLE IF EXISTS foodcategory;
DROP TABLE IF EXISTS ingredientdetail;
DROP TABLE IF EXISTS ingredient;
DROP TABLE IF EXISTS nutrientdetail;
DROP TABLE IF EXISTS nutrient;
DROP TABLE IF EXISTS nutrienttype;
DROP TABLE IF EXISTS food;

-- เปิดการตรวจสอบ Foreign Key อีกครั้ง
SET FOREIGN_KEY_CHECKS = 1;
```