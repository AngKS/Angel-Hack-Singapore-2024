import requests
from bs4 import BeautifulSoup

def get_post_heading_text(heading):
    #bs4.element -> str
    return heading.text

def get_post_first_image_url(soup_obj, heading):
    heading_text = get_post_heading_text(heading)
    post_image_alt = heading_text + "'s" + " images(0)"
    image = soup_obj.find('img', {'alt': post_image_alt})
    return image['src']

def get_post_caption(heading):
    # Find the next <p> element with class "short-content"
    caption_element = heading.find_next('p', class_='short-content')
    if not caption_element:
        print('No <p> element with class "short-content" found after the <h2> element')

    return caption_element.text[9:]

def get_post_url(heading):
    root_url = "https://www.lemon8-app.com"
    # Find the next <a> element containing the string "Read more"
    url_string = heading.find_next('a', string='Read more')

    if not url_string:
        print('No <a> element with text "Read more" found after the <h2> element')

    return root_url + url_string.get('href')

def scrape_posts(query, n):
    """
    Scrapes the first n posts from a given search query on lemon8 for the following info:
    1. Likes
    2. First photo
    3. title
    4. caption

    Returns a list of dictionaries containing the post information
    """

    post_info_list = []
    url = f"https://www.lemon8-app.com/discover/{query}"

    response = requests.get(url)
    # Check if the request was successful
    if response.status_code == 200:
        html_content = response.text
    else:
        print('Failed to retrieve the webpage')

    soup = BeautifulSoup(html_content, 'html.parser')

    #get first image alt
    post_heading_elements = soup.find_all('h2')  # This can be 'h2', 'h3', etc. depending on your need

    #for each post, scrape for key info and return 
    for post_index in range(n):
        post_heading_element = post_heading_elements[post_index]
        post_heading_text = get_post_heading_text(post_heading_element)
        post_image = get_post_first_image_url(soup, post_heading_element)
        post_caption = get_post_caption(post_heading_element)
        post_link = get_post_url(post_heading_element)
        post_info = {'post_heading': post_heading_text, 'post_image': post_image, 'post_caption': post_caption, 'post_link': post_link}
        post_info_list.append(post_info)
    return post_info_list
    
print(scrape_posts("bugis", 1))