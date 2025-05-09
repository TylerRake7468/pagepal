puts "Cleaning up old data..."
Vote.destroy_all
Recommendation.destroy_all
Book.destroy_all
User.destroy_all

puts "Creating users..."
users = [
  User.create!(email: "ram@example.com", password: "password"),
  User.create!(email: "krishna@example.com", password: "password"),
  User.create!(email: "shiv@example.com", password: "password")
]

puts "Creating books..."
book_data = [
  { title: "The Ramayana", author: "Valmiki", description: "The Ramayana, also known as Valmiki Ramayana, as traditionally attributed to Valmiki, is a smriti text from ancient India, one of the two important epics of Hinduism known as the Itihasas, the other being the Mahabharata", user: users[0] },
  { title: "Mahabharata", author: "Vyasa", description: "The Mahābhārata is one of the two major Sanskrit epics of ancient India revered as Smriti texts in Hinduism, the other being the Rāmāyaṇa. It narrates the events and aftermath of the Kurukshetra War, a war of succession between two groups of princely cousins, the Kauravas and the Pāṇḍavas.", user: users[0] },
  { title: "Wings of Fire", author: "A.P.J Abdul Kalam", description: "Wings of Fire, is the autobiography of the Missile Man of India and the former President of India, Dr. A. P. J. Abdul Kalam. It was written by him and Arun Tiwari.", user: users[0] },
  { title: "Ignited Minds", author: "A.P.J Abdul Kalam", description: "Ignited Minds: Unleashing the Power Within India is a book written by Dr. A. P. J. Abdul Kalam, President of India from 2002 to 2007. Dr. Kalam dedicated Ignited Minds to an intermediate school child he met at a school. While talking to students, a question came up:", user: users[0] },

  { title: "Harry Potter", author: "J.K. Rowling", description: "Harry Potter is a series of seven fantasy novels written by British author J. K. Rowling. The novels chronicle the lives of a young wizard, Harry Potter, and his friends, Ron Weasley and Hermione Granger, all of whom are students at Hogwarts School of Witchcraft and Wizardry..", user: users[1] },
  { title: "The Hobbit", author: "J.R.R. Tolkien", description: "The Hobbit, or There and Back Again is a children's fantasy novel by the English author J. R. R. Tolkien. It was published in 1937 to wide critical acclaim, being nominated for the Carnegie Medal and awarded a prize from the New York Herald Tribune for best juvenile fiction.", user: users[1] },
  { title: "Atomic Habits", author: "James Clear", description: "A supremely practical and useful book. James Clear distils the most fundamental information about habit formation, so you can accomplish more by focusing on less.", user: users[1] },
  { title: "Deep Work", author: "Cal Newport", description: "One of the most valuable skills in our economy is becoming increasingly rare. If you master this skill, you'll achieve extraordinary results.Deep Work is an indispensable guide to anyone seeking focused", user: users[1] },

  { title: "Clean Code", author: "Robert C. Martin", description: "Even bad code can function. But if code isn't clean, it can bring a development organization to its knees. Every year, countless hours and significant resources are lost because of poorly written code. ", user: users[2] },
  { title: "Design Patterns", author: "Gang of Four", description: "Design Patterns: Elements of Reusable Object-Oriented Software is a software engineering book describing software design patterns. The book was written by Erich Gamma, Richard Helm, Ralph Johnson, and John Vlissides, with a foreword by Grady Booch.", user: users[2] },
  { title: "The Pragmatic Programmer", author: "Andy Hunt", description: "The Pragmatic Programmer: From Journeyman to Master is a book about computer programming and software engineering, written by Andrew Hunt and David Thomas and published in October 1999. It is used as a textbook in related university courses.", user: users[2] },
  { title: "You Dont Know JS", author: "Kyle Simpson", description: "This book is more like an introduction to JavaScript, and emphasizes on how understanding JavaScript in deep can benefit the people who use it.", user: users[2] }
]

book_data.each do |data|
  book = Book.create!(title: data[:title], author: data[:author], description: data[:description], user: data[:user])

  image_name = data[:title].parameterize.underscore + ".jpg" # expects: the_ramayana.jpg
  image_path = Rails.root.join("db/seed_images", image_name)

  if File.exist?(image_path)
    book.image.attach(io: File.open(image_path), filename: image_name)
    puts "Attached image to #{book.title}"
  else
    puts "Image not found for #{book.title} — expected: #{image_name}"
  end
end

puts "Done seeding!"
