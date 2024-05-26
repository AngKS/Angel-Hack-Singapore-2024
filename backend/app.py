# app.py
from flask import Flask, request, jsonify
from lemon8_scraper import scrape_posts

app = Flask(__name__)

@app.route('/scrape', methods=['POST'])
def scrape_endpoint():
    data = request.json
    query = data.get('url')
    n = data.get('n')
    if not query or not isinstance(n, int):
        return jsonify({'error': 'Invalid input'}), 400
    try:
        results = scrape_posts(query, n)
        return jsonify({'results': results})
    except Exception as e:
        return jsonify({'error': str(e)}), 500

if __name__ == '__main__':
    app.run(debug=True)
