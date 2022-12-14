USE [master]
GO
/****** Object:  Database [NguyenCongNgo_FA22_Assignment]    Script Date: 10/29/2022 11:03:50 PM ******/
CREATE DATABASE [NguyenCongNgo_FA22_Assignment]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'NguyenCongNgo_FA22_Assignment', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NguyenCongNgo_FA22_Assignment.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'NguyenCongNgo_FA22_Assignment_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\NguyenCongNgo_FA22_Assignment_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [NguyenCongNgo_FA22_Assignment].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ARITHABORT OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET  ENABLE_BROKER 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET RECOVERY FULL 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET  MULTI_USER 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET DB_CHAINING OFF 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'NguyenCongNgo_FA22_Assignment', N'ON'
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET QUERY_STORE = OFF
GO
USE [NguyenCongNgo_FA22_Assignment]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [nvarchar](50) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[fullname] [nvarchar](50) NOT NULL,
	[isAdmin] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[username] [nvarchar](50) NOT NULL,
	[courseId] [nvarchar](100) NOT NULL,
	[quantity] [int] NOT NULL,
	[date] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[username] ASC,
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[id] [nvarchar](50) NOT NULL,
	[type] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[id] [nvarchar](100) NOT NULL,
	[name] [nvarchar](200) NOT NULL,
	[image] [nvarchar](100) NULL,
	[description] [nvarchar](2000) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[startDate] [nvarchar](50) NULL,
	[endDate] [nvarchar](50) NULL,
	[category] [nvarchar](50) NOT NULL,
	[status] [bit] NOT NULL,
	[createUser] [nvarchar](50) NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[updateUser] [nvarchar](50) NOT NULL,
	[updateDate] [nvarchar](50) NOT NULL,
	[courseId] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_History_1] PRIMARY KEY CLUSTERED 
(
	[updateUser] ASC,
	[courseId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shopping]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping](
	[username] [nvarchar](50) NULL,
	[courseId] [nvarchar](100) NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[date] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ShoppingNoLogin]    Script Date: 10/29/2022 11:03:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ShoppingNoLogin](
	[email] [nvarchar](100) NULL,
	[courseId] [nvarchar](100) NULL,
	[quantity] [int] NOT NULL,
	[price] [int] NOT NULL,
	[date] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NULL,
	[phone] [nvarchar](10) NULL,
	[discount] [nvarchar](100) NULL,
	[name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'a', N'a', N'A', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'abc', N'2', N'A B C', 0)
INSERT [dbo].[Account] ([username], [password], [fullname], [isAdmin]) VALUES (N'ngo', N'1', N'Nguyen Cong Ngo', 1)
GO
INSERT [dbo].[Cart] ([username], [courseId], [quantity], [date]) VALUES (N'a', N'10', 1, N'Mon Oct 24 16:37:46 ICT 2022')
INSERT [dbo].[Cart] ([username], [courseId], [quantity], [date]) VALUES (N'abc', N'21', 1, N'Sat Oct 29 22:39:29 ICT 2022')
INSERT [dbo].[Cart] ([username], [courseId], [quantity], [date]) VALUES (N'abc', N'24', 1, N'Thu Oct 27 21:57:07 ICT 2022')
GO
INSERT [dbo].[Category] ([id], [type]) VALUES (N'Course', N'Course')
INSERT [dbo].[Category] ([id], [type]) VALUES (N'Guitar', N'Guitar')
INSERT [dbo].[Category] ([id], [type]) VALUES (N'Instrusment', N'Instrusment')
INSERT [dbo].[Category] ([id], [type]) VALUES (N'Music', N'Music')
INSERT [dbo].[Category] ([id], [type]) VALUES (N'Piano', N'Piano')
INSERT [dbo].[Category] ([id], [type]) VALUES (N'Single', N'Single')
GO
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'1', N'10 Day Guitar Starter Course', N'IMAGE\course-img.png', N'A ''YouTube Friendly'' shorthand version of my Full Beginners Course including chords, lead guitar, riffs, strumming patterns and more', 5009, 0, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'10', N'Hindustani-Vocal: Introduction - 1', N'IMAGE\course-img.png', N'Syllabus: Hindustani Vocal - Lesson 1 - Introduction to Hindustani Classical Music and Raag Bhairav. Hindustani Vocal - Lesson 2 - Styles of Hindustani Classical Music - Khyal, Tumri, Ghazal. Hindustani Vocal : Hara Hara Mahadeva. Hindustani Vocal - Less', 2000, 558, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'11', N'How To Play Piano - Piano Lessons For Beginners', N'IMAGE\course-img.png', N'Syllabus: How To Label The Keys Of The Piano Keyboard - Piano Keys And Notes. Four Very Easy Piano Chords That Every Beginner Should Start With - Basic Chords. Very Easy Piano Chords That Every Beginner Should Know - Lesson 2 - Basic Chords. Easy Piano C', 4000, 525, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'12', N'Audio', N'IMAGE\course-img.png', N'Well', 1000, 5, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'13', N'How To Play Rock Drum Beats - Free Beginner Drum Lessons', N'IMAGE\course-img.png', N'5 videos to teach you how to play the drums.', 15000, 47, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'14', N'Interesting Chords: A Tour of Harmony & Voicing', N'IMAGE\course-img.png', N'Well', 3400, 48, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'15', N'Intermediate Guitar Course', N'IMAGE\course-img.png', N'More than 40 video lessons on various aspects of guitar playing. Barre chords, scales, finding notes, technique and training exercises, improvisation, muting techniques, melodic and strumming patterns, and more.', 5320, 0, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'16', N'Introduction To Music Theory', N'IMAGE\course-img.png', N'Learn key concepts and approaches needed to understand, create, and perform contemporary music.', 5200, 48, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'17', N'Jazz Piano: The Full Course', N'IMAGE\course-img.png', N'Syllabus: The Jazz Piano Course: What is functional harmony, and why should you care? (Lesson 1). The Jazz Piano Course: Chord tensions are at the heart of jazz! (Lesson 2). The Jazz Piano Course: Chord Substitutions explained and demystified! (Lesson 3)', 1200, 48, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'18', N'Ken', N'IMAGE\course-img.png', N'Greate', 3400, 48, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'19', N'Larnell Lewis Drum Lessons', N'IMAGE\course-img.png', N'Drumeo and Larnell Lewis present a video series to improve your drumming. Gospel drum beats and grooves, how to use electronics in modern drumming.', 5600, 342, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'2', N'Electric Guitar Starter Course', N'IMAGE\course-img.png', N'Learn the basics such as power chords, easy riffs, and palm muting straight away.', 6000, 1324, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'20', N'Learn All 40 Drum Rudiments', N'IMAGE\course-img.png', N'This playlist includes video lessons on all 40 drum rudiments - so you can learn the patterns and apply them to your drumming.', 7800, 4352, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'21', N'Learn to Play: Slide Guitar Basics with Jeff Massey', N'IMAGE\course-img.png', N'Slide guitar basics, riffs, and techniques.', 9823, 12, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'22', N'Beginner', N'IMAGE\course-img.png', N'Perfect', 2000, 1, N'29-09-2022', N'12-10-2022', N'Music', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'23', N'Music', N'IMAGE\course-img.png', N'Well', 4500, 42, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'24', N'Music and Social Action', N'IMAGE\course-img.png', N'What is a musicianâs response to the condition of the world? Do musicians have an obligation and an opportunity to serve the needs of the world with their musicianship? At a time of crisis for the classical music profession, with a changing commercial', 9800, 0, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'25', N'Music Psychology', N'IMAGE\course-img.png', N'Syllabus: Perception of Music — Diana Omigie. Music and Perinatal Care — Daisy Fancourt. Musical Memory — Daniel Müllensiefen. Arts ''on Prescription'' — Daisy Fancourt. Music and Autism — Pamela Heaton / Serious Science. Music-induced Emotions — Diana Omi', 9700, 5345, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'26', N'Opera', N'IMAGE\course-img.png', N'Well', 4466, 14, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'27', N'Piano', N'IMAGE\course-img.png', N'Good', 3399, 0, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'28', N'Piano Chord Hacks - By Pianote', N'IMAGE\course-img.png', N'Syllabus: Piano Chord Hacks #1: Intro To Chording (Piano Lesson). Piano Chord Hacks #2: Inversion Basics (Piano Lesson). Piano Chord Hacks #3: Left Hand Magic (Piano Lesson). Piano Chord Hacks #4: Putting It Together (Piano Lesson). Piano Chord Hacks #5', 6654, 25, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'29', N'Piano Lessons For Beginners Series - How To Play Piano', N'IMAGE\course-img.png', N'Syllabus: Piano Lessons For Beginners Lesson 1 - How To Play Piano Part 1 - Easy. Piano Lessons For Beginners Lesson 2 - How To Play Piano Part 2 - Easy. Piano Lessons For Beginners Lesson 3 - How To Play Piano Part 3 - Easy. Piano Lessons For Beginners', 5600, 65, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'3', N'Fandom, Community, and Identity in Popular Music', N'IMAGE\course-img.png', N'In "Fandom, Community, and Identity in Popular Music," you will explore the intersections of fandom and popular culture using pop music as a framework. You will apply your skills of self-reflection and close reading/analysis to a few case studies of pop', 5020, 543, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'30', N'Piano Modes', N'IMAGE\course-img.png', N'Learn the Piano Modes with these video lessons.', 5410, 23, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'31', N'Piano Music Theory For Dropouts', N'IMAGE\course-img.png', N'Music theory can be a chore for many learners. But theory is the language of music, and once you can speak it -- a whole new world opens up. Cassi will show you how simple and fun theory can be, and how your playing will improve dramatically by learning', 3456, 54, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'32', N'Beginner Drum Lessons', N'IMAGE\course-img.png', N'Beginner Drum Lessons from Drumeo will teach you how to play the drums!', 6000, 12, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'33', N'Piano Scales', N'IMAGE\course-img.png', N'Learn to play Piano Scales.', 1209, 365, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'34', N'Play 10 ELVIS songs with 3 EASY chords', N'IMAGE\course-img.png', N'Syllabus: - That''s All Right. - Heartbreak Hotel. - Hound Dog. - All Shook Up. - Swing rhythm. - (Let Me Be Your) Teddy Bear. - Blue Suede Shoes. - Jailhouse Rock. - Hard Headed Woman. - A Big Hunk o'' Love. - Suspicious Minds. - Way Down.', 3576, 23, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'35', N'Play 5 EASY Christmas Songs on Guitar', N'IMAGE\course-img.pngIMAGE\course-img.png', N'Syllabus: 1 - Rudolph The Red Nosed Reindeer . 2 - Jingle Bells . 3 - Deck The Halls . 4 - We Wish You A Merry Christmas . 5 - 12 Days Of Christmas .', 2445, 55, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'36', N'Practice Pad Drum Lessons', N'IMAGE\course-img.png', N'Looking for fun, engaging exercises to use on your practice pad? Look no further!', 4445, 3534, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'37', N'Pro Tools Basics', N'IMAGE\course-img.png', N'Producing music is an incredibly creative process, and knowing the tools of the trade is essential in order to transmit the musical ideas in your head into the DAW in a creative and uninhibited way. Whether you have used a computer to create music befor', 55767, 345, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'38', N'Reading Sheet Music for Beginners', N'IMAGE\course-img.png', N'Syllabus: Reading Sheet Music for Beginners (4/4). Reading Sheet Music for Beginners (3/4). Reading Sheet Music for Beginners (2/4). Reading Sheet Music for Beginners (1/4)', 7776, 325, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'39', N'Singel', N'IMAGE\course-img.png', N'Well', 23224, 345, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'4', N'Fastest Way To Get Faster - Drum Lesson Series', N'IMAGE\course-img.png', N'Impress your friends and family with your fast drum playing! These 10 videos by Jared Falk of Drumeo will teach you speed with control.', 8988, 124, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'40', N'Sound Design with Kontakt', N'IMAGE\course-img.png', N'This four-session course explores a practical approach to composing and producing music with Native Instruments Kontakt. We will cover the most important technical and aesthetic aspects of creating music with the industry-standard Kontakt sampler. Weekly', 22245, 345, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'41', N'Beginners Guitar Course', N'IMAGE\course-img.png', N'More than 70 videos about learning the guitar. Choosing a guitar and accessories, making the most of your practice time, tuning, chords, notes, rhythms, plus more.', 4000, 435, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'42', N'Strategies for Success in your Music Career', N'IMAGE\course-img.png', N'The Musicia Professional Toolbox is more than just a collection of career-building skills: professional musicians need strategies in place that maximize the impact of those skills. Designed for musicians at any point in their career, this course will', 78556, 563, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'43', N'Synth Tricks', N'IMAGE\course-img.png', N'48 videos on synthesis and producing synth sounds and tracks.', 4335, 2, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'44', N'The Art of Vocal Production', N'IMAGE\course-img.png', N'This course addresses recorded vocal performances and the technologies used to highlight and support them in modern record production and mixes. Most of us know that vocals serve as the focal point of modern recordings but many do not know the tools used', 56675, 1, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'45', N'The Funk Guitar Course: Comprehensive Guide to Chords and Techniques', N'IMAGE\course-img.png', N'Here you''ll find all the videos for my Funk guitar course - but remember you''ll find additional notes and tabs on the website!! :) We''ll be coving all the essential chords, techniques, grooves, mechanics and concepts you''ll need to get funky!', 3365, 5, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'46', N'The Piano Sonata: Beethoven and the Romantics', N'IMAGE\course-img.png', N'In this course, learners will review sonata form and learn how the piano sonata was taken to new heights by Ludwig van Beethoven. We’ll discover together how the generation that followed interpreted Beethoven’s achievements and put them into practice in', 4664, 2, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'47', N'The Piano Sonata: Origins to Mozart', N'IMAGE\course-img.png', N'In this course, you’ll be introduced to sonata form; how it works, where it came from, and how sonatas are put together as multi-movement compositions. We will analyze the early history of the piano sonata and discover the important early masters of this', 55342, 53, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'48', N'Trong', N'IMAGE\course-img.png', N'Ok', 67685, 3, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'49', N'Ukulele For Beginners', N'IMAGE\course-img.png', N'Syllabus: How To Play The Ukulele for Beginners.Ukulele Chords For Beginners | C, F, G &amp; Variations.Ukulele Chords For Beginners | A, D, E &amp; Variations.How To Strum the Ukulele - The Shuffle Rhythm.Ukulele Hit Strumming Pattern for Beginners.Lear', 3434, 2, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'5', N'Folk Guitar Fingerstyle Module', N'IMAGE\course-img.png', N'Ten video lessons on various aspects of playing fingerstyle guitar.', 12000, 543, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'50', N'Why Is Travis Picking So Important? (a complete introduction)', N'IMAGE\course-img.png', N'Syllabus: Cannonball Rag. Who was Merle Travis? . Chet Atkins and Legacy of Merle Travis. What is Travis Picking?. Merles picking technique. Piece from Jarvis''s Fingerstyle Course. Chet Atkins picking technique. Pinky down?. Should you grow your', 65856, 225, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'51', N'Carnatic-Vocal: Sarali Varisai - 2', N'IMAGE\course-img.png', N'Syllabus: Three Degrees Of Speed. Sarali Varisai - 1. sarali varisai - 2. sarali varisai - 3. sarali varisai - 4. sarali varisai - 5. sarali varisai - 6. sarali varisai - 7. sarali varisai - 8. sarali varisai - 9. sarali varisai - 10. sarali var', 3000, 1, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'52', N'Classical', N'IMAGE\course-img.png', N'Well', 12000, 4, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'53', N'Classical Works', N'IMAGE\course-img.png', N'Take an aural journey through 17th- to 20th-century Europe—exploring world-renowned works in classical, orchestral, and operatic music to create a cultural and social context for each performance’s circumstances. You’ll begin your tour 1607, Matua, Ital', 45000, 1, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'54', N'Copyright Law in the Music Business', N'IMAGE\course-img.png', N'In this course taught by E. Michael Harrington, students will learn the basis for copyright including what is and is not covered by copyright law. This course will help clarify what rights artists have as creators as well as what the public is free to ta', 4500, 5, N'29-09-2022', N'12-10-2022', N'Guitar', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'55', N'Nguyen Cong Ngo Tutorial', N'', N'Perfect', 100000, 5, N'29-09-2022', N'12-10-2022', N'Course', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'56', N'    a', N' a', N' a', 1, 1, N'04-10-2022', N'20-10-2022', N'Course', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'57', N'1', N'a', N'a', 1, 1, N'12-10-2022', N'20-10-2022', N'Course', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'58', N'a', N'a', N'a', 1, 1, N'13-10-2022', N'29-10-2022', N'Course', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'59', N'b', N'b', N'b', 2, 2, N'29-09-2022', N'05-11-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'6', N'Giutar', N'IMAGE\course-img.png', N'Well', 23000, 2334, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'7', N'Guitar Basics - Beginners Course Intro Level', N'IMAGE\course-img.png', N'What guitar should you buy? String names, tuning, how to read guitar TAB and chord boxes.', 567, 325, N'29-09-2022', N'12-10-2022', N'Instrusment', 1, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'8', N'GuitBass Tricksar', N'IMAGE\course-img.png', N'Explores bass styles of famous performers, bass pedal tricks, walking bass, comparing 5 ways of recording bass guitar.', 34000, 6, N'29-09-2022', N'12-10-2022', N'Instrusment', 0, N'ngo')
INSERT [dbo].[Course] ([id], [name], [image], [description], [price], [quantity], [startDate], [endDate], [category], [status], [createUser]) VALUES (N'9', N'Hallo', N'IMAGE\course-img.png', N'Haiza', 45, 10000000, N'29-09-2022', N'12-10-2022', N'Piano', 1, N'ngo')
GO
INSERT [dbo].[History] ([updateUser], [updateDate], [courseId]) VALUES (N'ngo', N'Wed Oct 26 21:35:15 ICT 2022', N'1')
INSERT [dbo].[History] ([updateUser], [updateDate], [courseId]) VALUES (N'ngo', N'Sun Oct 23 19:24:15 ICT 2022', N'10')
INSERT [dbo].[History] ([updateUser], [updateDate], [courseId]) VALUES (N'ngo', N'Thu Oct 27 20:17:54 ICT 2022', N'15')
INSERT [dbo].[History] ([updateUser], [updateDate], [courseId]) VALUES (N'ngo', N'Thu Oct 27 20:18:12 ICT 2022', N'24')
INSERT [dbo].[History] ([updateUser], [updateDate], [courseId]) VALUES (N'ngo', N'Thu Oct 27 20:17:45 ICT 2022', N'27')
GO
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'13', 4, 60000, N'Sun Oct 23 22:51:14 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'19', 2, 11200, N'Sun Oct 23 22:51:30 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'3', 2, 10040, N'Sun Oct 23 23:09:40 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'a', N'10', 2, 4000, N'Mon Oct 24 15:39:48 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'13', 1, 15000, N'Thu Oct 27 19:29:08 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'10', 1, 2000, N'Thu Oct 27 19:29:48 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'15', 2, 10640, N'Thu Oct 27 19:29:48 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'1', 1, 5009, N'Thu Oct 27 19:30:35 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'10', 1, 2000, N'Thu Oct 27 19:30:35 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'13', 1, 15000, N'Thu Oct 27 19:32:11 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'1', 5, 25045, N'Thu Oct 27 19:40:13 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'10', 2, 4000, N'Thu Oct 27 19:40:59 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'1', 1, 5009, N'Thu Oct 27 20:14:54 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'10', 2, 4000, N'Sat Oct 29 22:40:35 ICT 2022')
INSERT [dbo].[Shopping] ([username], [courseId], [quantity], [price], [date]) VALUES (N'abc', N'13', 1, 15000, N'Thu Oct 27 19:59:18 ICT 2022')
GO
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'1', N'19', 1, 5600, N'Fri Oct 28 11:02:12 ICT 2022', N'1', N'1', N'', N'1')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'ngocongnguyen190802@gmail.com', N'10', 1, 2000, N'Fri Oct 28 11:08:44 ICT 2022', N'Lạc Long Quân', N'0981366913', N'', N'Nguyễn Công Ngọ')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'ngocongnguyen190802@gmail.com', N'13', 1, 15000, N'Fri Oct 28 11:08:44 ICT 2022', N'Lạc Long Quân', N'0981366913', N'', N'Nguyễn Công Ngọ')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'ngocongnguyen190802@gmail.com', N'10', 1, 2000, N'Fri Oct 28 11:10:55 ICT 2022', N'Lạc Long Quân', N'0981366913', N'', N'Nguyễn Công Ngọ')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'ngocongnguyen190802@gmail.com', N'13', 1, 15000, N'Fri Oct 28 11:10:55 ICT 2022', N'Lạc Long Quân', N'0981366913', N'', N'Nguyễn Công Ngọ')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'ngocongnguyen190802@gmail.com', N'13', 1, 15000, N'Fri Oct 28 11:11:30 ICT 2022', N'Lạc Long Quân', N'1', N'', N'Nguyễn Công Ngọ')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'a@gmail.com', N'10', 1, 2000, N'Sat Oct 29 22:59:02 ICT 2022', N'a', N'0981366913', N'', N'a')
INSERT [dbo].[ShoppingNoLogin] ([email], [courseId], [quantity], [price], [date], [address], [phone], [discount], [name]) VALUES (N'a@gmail.com', N'34', 1, 3576, N'Sat Oct 29 23:01:03 ICT 2022', N'a', N'0981366913', N'a', N'a')
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK__Cart__username__7F2BE32F] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK__Cart__username__7F2BE32F]
GO
ALTER TABLE [dbo].[Category]  WITH CHECK ADD FOREIGN KEY([type])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK__Course__category__49C3F6B7] FOREIGN KEY([category])
REFERENCES [dbo].[Category] ([id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK__Course__category__49C3F6B7]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD FOREIGN KEY([createUser])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[History]  WITH CHECK ADD  CONSTRAINT [FK__History__updateU__6FE99F9F] FOREIGN KEY([updateUser])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[History] CHECK CONSTRAINT [FK__History__updateU__6FE99F9F]
GO
ALTER TABLE [dbo].[Shopping]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
ALTER TABLE [dbo].[Shopping]  WITH CHECK ADD FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[ShoppingNoLogin]  WITH CHECK ADD FOREIGN KEY([courseId])
REFERENCES [dbo].[Course] ([id])
GO
USE [master]
GO
ALTER DATABASE [NguyenCongNgo_FA22_Assignment] SET  READ_WRITE 
GO
