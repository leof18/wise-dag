from flask import Flask, send_from_directory, render_template_string

app = Flask(__name__, static_url_path='', static_folder='static')

@app.route("/")
def home():
    return render_template_string("""
        <!DOCTYPE html>
        <html lang="en">
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <title>Local DAGitty</title>
            <style>
                body {
                    display: flex;
                    justify-content: center;
                    align-items: center;
                    flex-direction: column;
                    margin: 0;
                    padding: 0;
                }
                iframe {
                    width: 100%;
                    height: 80vh; /* 80% of the viewport height */
                    border: none;
                }
            </style>
        </head>
        <body>
            <h1>DAGitty Hosted Locally</h1>
            <iframe src="dagitty-3.1/gui/dags.html"></iframe>
        </body>
        </html>
    """)

if __name__ == "__main__":
    app.run(debug=True)
