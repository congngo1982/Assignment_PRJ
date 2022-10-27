CREATE DATABASE [NguyenCongNgo_FA22_Assignment]

USE [NguyenCongNgo_FA22_Assignment] 

CREATE TABLE [Account](
username NVARCHAR(50) PRIMARY KEY,
password NVARCHAR(50) NOT NULL,
fullname NVARCHAR(50) NOT NULL,
isAdmin BIT,
)

CREATE TABLE [Course] (
id NVARCHAR(100) PRIMARY KEY,
name NVARCHAR(100),
image NVARCHAR(100),
description NVARCHAR(200) NOT NULL,
price int NOT NULL,
startDate NVARCHAR(50),
endDate NVARCHAR(50),
category NVARCHAR(50) NOT NULL,
status BIT NOT NULL,
)

ALTER TABLE [Course]
ADD FOREIGN KEY (category) REFERENCES [Category](id)

CREATE TABLE [Category] (
id NVARCHAR(50) PRIMARY KEY ,
type NVARCHAR(50) REFERENCES Category(id)
)

CREATE TABLE [History](
updateUser NVARCHAR(50) REFERENCES [Account](username),
courseId NVARCHAR(100) REFERENCES [Course](id),
updateDate NVARCHAR(50)
)

CREATE TABLE Cart(
username NVARCHAR(50) REFERENCES [Account](username),
courseId NVARCHAR(100) REFERENCES [Course](id),
quantity int NOT NULL
)

CREATE TABLE [Shopping](
username NVARCHAR(50) REFERENCES [Account](username),
courseId NVARCHAR(100) REFERENCES [Course](id),
quantity int NOT NULL,
price int NOT NULL,
date NVARCHAR(50) NOT NULL
)

SELECT *
FROM dbo.Course
WHERE name LIKE '%a%' AND status = 0
ORDER BY quantity
OFFSET 0 ROWS FETCH NEXT 3 ROWS ONLY

INSERT INTO [Category](id, type)
VALUES ('Instrusment', 'Instrusment'),
('Course', 'Course'),
('abc', 'abc'),
('m', 'm'),
('r', 'r'),
('n', 'n'),
('s', 's'),
('w', 'w'),
('xyz', 'xyz')

INSERT INTO [Course](name, image, description, price, quantity, startDate, endDate, category, status)
VALUES ('Music', NULL, 'Well', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Audio', NULL, 'Well', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Singel', NULL, 'Well', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Classical', NULL, 'Well', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Opera', NULL, 'Well', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('The Piano Sonata: Origins to Mozart', NULL, 'In this course, you’ll be introduced to sonata form; how it works, where it came from, and how sonatas are put together as multi-movement compositions. We will analyze the early history of the piano sonata and discover the important early masters of this', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('The Piano Sonata: Beethoven and the Romantics', NULL, 'In this course, learners will review sonata form and learn how the piano sonata was taken to new heights by Ludwig van Beethoven. We’ll discover together how the generation that followed interpreted Beethoven’s achievements and put them into practice in', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('The Art of Vocal Production', NULL, 'This course addresses recorded vocal performances and the technologies used to highlight and support them in modern record production and mixes. Most of us know that vocals serve as the focal point of modern recordings but many do not know the tools used', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Pro Tools Basics', NULL, 'Producing music is an incredibly creative process, and knowing the tools of the trade is essential in order to transmit the musical ideas in your head into the DAW in a creative and uninhibited way. Whether you have used a computer to create music befor', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Fandom, Community, and Identity in Popular Music', NULL, 'In "Fandom, Community, and Identity in Popular Music," you will explore the intersections of fandom and popular culture using pop music as a framework. You will apply your skills of self-reflection and close reading/analysis to a few case studies of pop', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Strategies for Success in your Music Career', NULL, 'The Musicia Professional Toolbox is more than just a collection of career-building skills: professional musicians need strategies in place that maximize the impact of those skills. Designed for musicians at any point in their career, this course will', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Classical Works', NULL, 'Take an aural journey through 17th- to 20th-century Europe—exploring world-renowned works in classical, orchestral, and operatic music to create a cultural and social context for each performance’s circumstances. You’ll begin your tour 1607, Matua, Ital', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Copyright Law in the Music Business', NULL, 'In this course taught by E. Michael Harrington, students will learn the basis for copyright including what is and is not covered by copyright law. This course will help clarify what rights artists have as creators as well as what the public is free to ta', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Music Psychology', NULL, 'Syllabus: Perception of Music — Diana Omigie. Music and Perinatal Care — Daisy Fancourt. Musical Memory — Daniel Müllensiefen. Arts ''on Prescription'' — Daisy Fancourt. Music and Autism — Pamela Heaton / Serious Science. Music-induced Emotions — Diana Omi', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Sound Design with Kontakt', NULL, 'This four-session course explores a practical approach to composing and producing music with Native Instruments Kontakt. We will cover the most important technical and aesthetic aspects of creating music with the industry-standard Kontakt sampler. Weekly', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Introduction To Music Theory', NULL, 'Learn key concepts and approaches needed to understand, create, and perform contemporary music.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Music and Social Action', NULL, 'What is a musician’s response to the condition of the world? Do musicians have an obligation and an opportunity to serve the needs of the world with their musicianship? At a time of crisis for the classical music profession, with a changing commercial', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Play 5 EASY Christmas Songs on Guitar', NULL, 'Syllabus: 1 - Rudolph The Red Nosed Reindeer . 2 - Jingle Bells . 3 - Deck The Halls . 4 - We Wish You A Merry Christmas . 5 - 12 Days Of Christmas .', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Why Is Travis Picking So Important? (a complete introduction)', NULL, 'Syllabus: Cannonball Rag. Who was Merle Travis? . Chet Atkins and Legacy of Merle Travis. What is Travis Picking?. Merles picking technique. Piece from Jarvis''s Fingerstyle Course. Chet Atkins picking technique. Pinky down?. Should you grow your', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Play 10 ELVIS songs with 3 EASY chords', NULL, 'Syllabus: - That''s All Right. - Heartbreak Hotel. - Hound Dog. - All Shook Up. - Swing rhythm. - (Let Me Be Your) Teddy Bear. - Blue Suede Shoes. - Jailhouse Rock. - Hard Headed Woman. - A Big Hunk o'' Love. - Suspicious Minds. - Way Down.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Beginner Drum Lessons', NULL, 'Beginner Drum Lessons from Drumeo will teach you how to play the drums!', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Piano Modes', NULL, 'Learn the Piano Modes with these video lessons.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Piano Scales', NULL, 'Learn to play Piano Scales.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Reading Sheet Music for Beginners', NULL, 'Syllabus: Reading Sheet Music for Beginners (4/4). Reading Sheet Music for Beginners (3/4). Reading Sheet Music for Beginners (2/4). Reading Sheet Music for Beginners (1/4)', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Beginners Guitar Course', NULL, 'More than 70 videos about learning the guitar. Choosing a guitar and accessories, making the most of your practice time, tuning, chords, notes, rhythms, plus more.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Intermediate Guitar Course', NULL, 'More than 40 video lessons on various aspects of guitar playing. Barre chords, scales, finding notes, technique and training exercises, improvisation, muting techniques, melodic and strumming patterns, and more.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Folk Guitar Fingerstyle Module', NULL, 'Ten video lessons on various aspects of playing fingerstyle guitar.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Ukulele For Beginners', NULL, 'Syllabus: How To Play The Ukulele for Beginners.Ukulele Chords For Beginners | C, F, G &amp; Variations.Ukulele Chords For Beginners | A, D, E &amp; Variations.How To Strum the Ukulele - The Shuffle Rhythm.Ukulele Hit Strumming Pattern for Beginners.Lear', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Piano Lessons For Beginners Series - How To Play Piano', NULL, 'Syllabus: Piano Lessons For Beginners Lesson 1 - How To Play Piano Part 1 - Easy. Piano Lessons For Beginners Lesson 2 - How To Play Piano Part 2 - Easy. Piano Lessons For Beginners Lesson 3 - How To Play Piano Part 3 - Easy. Piano Lessons For Beginners', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('How To Play Rock Drum Beats - Free Beginner Drum Lessons', NULL, '5 videos to teach you how to play the drums.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Guitar Basics - Beginners Course Intro Level', NULL, 'What guitar should you buy? String names, tuning, how to read guitar TAB and chord boxes.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Larnell Lewis Drum Lessons', NULL, 'Drumeo and Larnell Lewis present a video series to improve your drumming. Gospel drum beats and grooves, how to use electronics in modern drumming.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Carnatic-Vocal: Sarali Varisai - 2', NULL, 'Syllabus: Three Degrees Of Speed. Sarali Varisai - 1. sarali varisai - 2. sarali varisai - 3. sarali varisai - 4. sarali varisai - 5. sarali varisai - 6. sarali varisai - 7. sarali varisai - 8. sarali varisai - 9. sarali varisai - 10. sarali var', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('The Funk Guitar Course: Comprehensive Guide to Chords and Techniques', NULL, 'Here you''ll find all the videos for my Funk guitar course - but remember you''ll find additional notes and tabs on the website!! :) We''ll be coving all the essential chords, techniques, grooves, mechanics and concepts you''ll need to get funky!', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('10 Day Guitar Starter Course', NULL, 'A ''YouTube Friendly'' shorthand version of my Full Beginners Course including chords, lead guitar, riffs, strumming patterns and more', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Learn All 40 Drum Rudiments', NULL, 'This playlist includes video lessons on all 40 drum rudiments - so you can learn the patterns and apply them to your drumming.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Synth Tricks', NULL, '48 videos on synthesis and producing synth sounds and tracks.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Electric Guitar Starter Course', NULL, 'Learn the basics such as power chords, easy riffs, and palm muting straight away.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('GuitBass Tricksar', NULL, 'Explores bass styles of famous performers, bass pedal tricks, walking bass, comparing 5 ways of recording bass guitar.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Fastest Way To Get Faster - Drum Lesson Series', NULL, 'Impress your friends and family with your fast drum playing! These 10 videos by Jared Falk of Drumeo will teach you speed with control.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Learn to Play: Slide Guitar Basics with Jeff Massey', NULL, 'Slide guitar basics, riffs, and techniques.', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Practice Pad Drum Lessons', NULL, 'Looking for fun, engaging exercises to use on your practice pad? Look no further!', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Hindustani-Vocal: Introduction - 1', NULL, 'Syllabus: Hindustani Vocal - Lesson 1 - Introduction to Hindustani Classical Music and Raag Bhairav. Hindustani Vocal - Lesson 2 - Styles of Hindustani Classical Music - Khyal, Tumri, Ghazal. Hindustani Vocal : Hara Hara Mahadeva. Hindustani Vocal - Less', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Piano Chord Hacks - By Pianote', NULL, 'Syllabus: Piano Chord Hacks #1: Intro To Chording (Piano Lesson). Piano Chord Hacks #2: Inversion Basics (Piano Lesson). Piano Chord Hacks #3: Left Hand Magic (Piano Lesson). Piano Chord Hacks #4: Putting It Together (Piano Lesson). Piano Chord Hacks #5', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('How To Play Piano - Piano Lessons For Beginners', NULL, 'Syllabus: How To Label The Keys Of The Piano Keyboard - Piano Keys And Notes. Four Very Easy Piano Chords That Every Beginner Should Start With - Basic Chords. Very Easy Piano Chords That Every Beginner Should Know - Lesson 2 - Basic Chords. Easy Piano C', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Interesting Chords: A Tour of Harmony & Voicing', NULL, 'Well', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Jazz Piano: The Full Course', NULL, 'Syllabus: The Jazz Piano Course: What is functional harmony, and why should you care? (Lesson 1). The Jazz Piano Course: Chord tensions are at the heart of jazz! (Lesson 2). The Jazz Piano Course: Chord Substitutions explained and demystified! (Lesson 3)', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0),
('Piano Music Theory For Dropouts', NULL, 'Music theory can be a chore for many learners. But theory is the language of music, and once you can speak it -- a whole new world opens up. Cassi will show you how simple and fun theory can be, and how your playing will improve dramatically by learning', 15000, 5, '1-1-2022', '25-2-2022', 'Instrusment', 0)
