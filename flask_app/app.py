from flask import Flask


app = Flask(__name__)


@app.route('/')
@app.route('/index')
def index():
    return "Hello, World! WOW"


if __name__ == "__main__":
    app.run(host='0.0.0.0')
