from flask import Flask

app = Flask(__name__)
from flask import render_template


@app.route('/')
def hello_world():
    return 'Hello, World!'