import cx_Oracle
import mysql.connector
import pandas as pd
from sqlalchemy import create_engine

# เชื่อมต่อ OracleDB
oracle_db= os.getenv('OracleDB')
oracle_conn = cx_Oracle.connect(oracle_db)
oracle_cursor = oracle_conn.cursor()

# เชื่อมต่อ MySQL Staging DB
mysql_db = os.getenv('MySQLDB')
mysql_engine = create_engine(mysql_db)

# รายชื่อตารางที่ต้องการโอนข้อมูล
tables = ["nutrienttype", "nutrient", "food", "nutrientdetail", "ingredient", "ingredientdetail",
          "foodcategory", "foodcategorydetail", "condition", "exercise", "appuser",
          "usercondition", "meal", "mealdetail", "favoritefood", "foodallergy"]

for table in tables:
    print(f"Extracting {table} from Oracle...")
    
    # ดึงข้อมูลจาก Oracle
    oracle_cursor.execute(f"SELECT * FROM {table}")
    columns = [desc[0] for desc in oracle_cursor.description]  # ดึงชื่อคอลัมน์
    rows = oracle_cursor.fetchall()

    # แปลงข้อมูลเป็น DataFrame
    df = pd.DataFrame(rows, columns=columns)

    # โหลดข้อมูลลง MySQL Staging
    df.to_sql(table, mysql_engine, if_exists="replace", index=False)
    
    print(f"Loaded {table} into MySQL Staging")

# ปิดการเชื่อมต่อ
oracle_cursor.close()
oracle_conn.close()
