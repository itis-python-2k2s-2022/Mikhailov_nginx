from flask import Flask, render_template


app = Flask(__name__)


@app.route('/')
@app.route('/index')
def index():
    render_template("index.html")


@app.route('/<string>')
def some_unknown_string(string):
    return "Hello from flask + " + string


if __name__ == "__main__":
    app.run(host='0.0.0.0')
