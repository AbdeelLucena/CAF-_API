import os
import psycopg2
from flask import  g
from Globals import *


def get_db_connection():
    
    """
    gera um conexão com banco de dados, armazenando informações no contexto da aplicação

    - conn = getattr(g, database, None)
        Pega o database do g, se n ao tiver ele retorna none e conecta depois 
        
    - conn = g._database = sqlite3.connect(DATABASE_NAME)
        Coloca database do contexto a conexão com o sqlite3 e coloca a conexão em 
        contexto dentro do conn
    
    """
    from app import app
    # Crie um contexto de aplicação
    with app.app_context():
        
        conn = getattr(g, '_database', None)
        if conn is None:
            conn = psycopg2.connect(database=DATABASE_NAME,  
                            user=DATABASE_USER, 
                            password=DATABASE_PASSWORD,  
                            host=DATABASE_HOST, port=DATABASE_PORT) 
    return conn
