# PagePal – Book Recommendation Platform

PagePal is a book-sharing web application built with Ruby on Rails. Users can recommend books, write reviews, upvote suggestions, and explore trending books — all with a responsive UI powered by Tailwind CSS.

## Features

-  User authentication via Devise (Sign up, Login, Logout)
-  Add new books with title, author, description, and cover image
-  Write recommendations for any book
-  Upvote / remove upvote on recommendations
-  View recommendations in a responsive grid or book-wise layout
-  Profile page showing user's books, reviews, and total votes received
-  Trending page sorted by total recommendation votes


## Setup Instructions
Make sure you have **Ruby 3.2+, Rails 7+, PostgreSQL**, and **Node.js** installed.
1. Clone the repo
   - git clone https://github.com/TylerRake7468/pagepal.git
   - cd pagepal
   
2. Install dependencies
   - bundle install

3. Setup database
   - bin/rails db:setup

4. Install TailwindCSS
   - bin/rails tailwindcss:install

5. Start the app
   - bin/dev



