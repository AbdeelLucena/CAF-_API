from helpers.database import get_db_connection
from Globals import *


with open('schema.sql', encoding='utf-8') as f:
    sql = f.read()
    
conn = get_db_connection()
cursor = conn.cursor()
cursor.execute(sql)
conn.commit()
cursor.close()
conn.close()