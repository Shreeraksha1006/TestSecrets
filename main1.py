import os
from fastapi import FastAPI

app = FastAPI()
@app.get("/")
def read_root():
    test = os.getenv('test_value',"Default Value")
    return {"test_value": test}


