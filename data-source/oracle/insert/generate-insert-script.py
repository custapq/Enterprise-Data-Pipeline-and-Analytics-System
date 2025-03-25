import json

# ฟังก์ชันสำหรับสร้างคำสั่ง INSERT จากข้อมูล JSON
def generate_insert_script_from_json(json_file):
    # อ่านข้อมูลจากไฟล์ JSON
    with open(json_file, 'r', encoding='utf-8') as file:
        data = json.load(file)

    insert_scripts = []

    # ตัวแปรนับสำหรับ ntdetailcode และ fcdetailcode
    ntdetailcode_counter = 1
    fcdetailcode_counter = 1

    # Loop ผ่านแต่ละรายการใน JSON
    for item in data:
        # ข้อมูลพื้นฐานของอาหาร
        thai_name = item.get("thaiName", "").replace("'", "''")[:40]  # จำกัดความยาว 40 ตัวอักษร
        english_name = item.get("englishName", "").replace("'", "''")[:40]
        image_url = item.get("imageURL", "").replace("'", "''")[:250]  # จำกัดความยาว 250 ตัวอักษร
        category = item.get("Category", "")

        # สร้างคำสั่ง INSERT สำหรับตาราง food
        fdcode = data.index(item)  # ใช้ index เป็น fdcode
        food_insert = f"INSERT INTO food (fdcode, fdtname, fdename, imageurl, fooddesc) VALUES ({fdcode},'{thai_name}','{english_name}','{image_url}','');"
        insert_scripts.append(food_insert)

        # แยกหมวดหมู่อาหารและสร้างคำสั่ง INSERT สำหรับตาราง foodcategorydetail
        categories = category.split(",")
        for seq, cat in enumerate(categories, start=1):
            fccode = categories.index(cat) + 1  # รหัสหมวดหมู่เริ่มต้นที่ 1
            foodcategorydetail_insert = f"INSERT INTO foodcategorydetail (fcdetailcode, fdcode, seq, fccode) VALUES ({fcdetailcode_counter},{fdcode},{seq},{fccode});"
            insert_scripts.append(foodcategorydetail_insert)
            fcdetailcode_counter += 1  # เพิ่มค่าตัวนับสำหรับ fcdetailcode

        # สร้างคำสั่ง INSERT สำหรับตาราง nutrientdetail
        nutrients = {
            "energy": {"ntcode": 1, "unit": "kcal"},
            "water": {"ntcode": 2, "unit": "g"},
            "protein": {"ntcode": 3, "unit": "g"},
            "fat": {"ntcode": 4, "unit": "g"},
            "carbohydrate": {"ntcode": 5, "unit": "g"},
            "fiber": {"ntcode": 23, "unit": "g"},
            "ash": {"ntcode": 24, "unit": "g"},
            "calcium": {"ntcode": 6, "unit": "g"},
            "phosphorus": {"ntcode": 7, "unit": "g"},
            "magnesium": {"ntcode": 8, "unit": "g"},
            "sodium": {"ntcode": 9, "unit": "g"},
            "potassium": {"ntcode": 10, "unit": "g"},
            "iron": {"ntcode": 11, "unit": "g"},
            "copper": {"ntcode": 12, "unit": "g"},
            "zinc": {"ntcode": 13, "unit": "g"},
            "iodine": {"ntcode": 14, "unit": "g"},
            "beta-carotene": {"ntcode": 15, "unit": "g"},
            "retinol": {"ntcode": 16, "unit": "g"},
            "vitamin-A": {"ntcode": 17, "unit": "g"},
            "thiamin": {"ntcode": 18, "unit": "g"},
            "riboflavin": {"ntcode": 19, "unit": "g"},
            "niacin": {"ntcode": 20, "unit": "g"},
            "vitamin-C": {"ntcode": 21, "unit": "g"},
            "vitamin-E": {"ntcode": 22, "unit": "g"},
            "sugar": {"ntcode": 25, "unit": "g"},
        }

        for seq, (nutrient, details) in enumerate(nutrients.items(), start=1):
            amount = item.get(nutrient, 0)
            ntcode = details["ntcode"]
            unit = details["unit"]
            nutrientdetail_insert = f"INSERT INTO nutrientdetail (ntdetailcode, fdcode, seq, ntcode, amount, unit) VALUES ({ntdetailcode_counter},{fdcode},{seq},{ntcode},{amount},'{unit}');"
            insert_scripts.append(nutrientdetail_insert)
            ntdetailcode_counter += 1  # เพิ่มค่าตัวนับสำหรับ ntdetailcode

    # Combine all insert scripts into a single string
    return "\n".join(insert_scripts)


# ฟังก์ชันหลัก
if __name__ == "__main__":
    # ระบุชื่อไฟล์ JSON ที่ต้องการประมวลผล
    json_file = "nutrient-mysql.json"  # เปลี่ยนชื่อไฟล์ตามที่คุณมี

    # สร้างคำสั่ง INSERT
    insert_script = generate_insert_script_from_json(json_file)

    # เขียนผลลัพธ์ลงในไฟล์ SQL
    output_sql_file = "output_insert_mysql.sql"
    with open(output_sql_file, 'w', encoding='utf-8') as file:
        file.write(insert_script)

    print(f"SQL Insert Script has been generated successfully: {output_sql_file}")