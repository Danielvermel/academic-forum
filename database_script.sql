-- Drop
DROP VIEW  IF EXISTS booksView;
DROP VIEW  IF EXISTS booksCommentsView;
DROP VIEW  IF EXISTS articlesView;
DROP VIEW  IF EXISTS articlesCommentsView;
DROP TABLE IF EXISTS academic_forum.articles CASCADE;
DROP TABLE IF EXISTS academic_forum.books CASCADE;
DROP TABLE IF EXISTS academic_forum.comments CASCADE;
DROP TABLE IF EXISTS academic_forum.essentialInfo CASCADE;
DROP SCHEMA IF EXISTS academic_forum;

-- Schema 
CREATE SCHEMA academic_forum;

----------------------------------------------
---------------- Create Tables  --------------
----------------------------------------------

-- 1.1 Essential Info
CREATE TABLE academic_forum.essentialInfo
(
    "infoId" int NOT NULL,
    title character varying(300) NOT NULL,
    author character varying(300) NOT NULL,
    "publicationDate" date NOT NULL,
    "urlCoverPhoto" character varying(300) NOT NULL,
    PRIMARY KEY ("infoId")
);


-- 1.2 Comments Table
CREATE TABLE academic_forum.comments
(
    "commentId" int NOT NULL,
    content character varying(1000) NOT NULL,
    creator character varying(100) NOT NULL,
    "creationDate" date NOT NULL,
    "commentInfoId" int NOT NULL,
    PRIMARY KEY ("commentId"),
    CONSTRAINT "infoId" FOREIGN KEY ("commentInfoId")
        REFERENCES academic_forum.essentialInfo ("infoId") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

--  1.3 Books
CREATE TABLE academic_forum.books
(
    "bookId" int NOT NULL,
    publisher character varying(100) NOT NULL,
    "bookInfoId" int NOT NULL,
    PRIMARY KEY ("bookId"),
    CONSTRAINT "infoId" FOREIGN KEY ("bookInfoId")
        REFERENCES academic_forum.essentialInfo ("infoId") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);
-- 1.4 Articles
CREATE TABLE academic_forum.articles
(
    "articleId" int NOT NULL,
    "journalIssueNumber" int NOT NULL,
    "journalPublished" character varying(100) NOT NULL,
    "articleInfoId" int NOT NULL,
    PRIMARY KEY ("articleId"),
    CONSTRAINT "infoId" FOREIGN KEY ("articleInfoId")
        REFERENCES academic_forum.essentialInfo ("infoId") MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);


----------------------------------------------
----------------- Create Views  --------------
----------------------------------------------

-- 2.1 Books View
CREATE VIEW academic_forum."booksView" AS
SELECT 
      "bookId", 
      title, 
      author,
      "publicationDate", 
      "urlCoverPhoto", 
      publisher
    FROM academic_forum.essentialInfo 
    INNER JOIN academic_forum.books 
        ON books."bookInfoId" = essentialInfo."infoId";

-- 2.2 Books View (with Comments)
CREATE VIEW academic_forum."booksCommentsView" AS
SELECT 
      "bookId", 
      title, 
      author,
      "publicationDate", 
      "urlCoverPhoto", 
      publisher,
	  content,
	  creator,
	  "creationDate"
    FROM academic_forum.essentialInfo 
    INNER JOIN academic_forum.books 
        ON books."bookInfoId" = essentialInfo."infoId"
	INNER JOIN academic_forum.comments
		ON  comments."commentInfoId" = essentialInfo."infoId";

-- 2.3 Articles View
CREATE VIEW academic_forum."articlesView" AS
SELECT 
      "articleId", 
      title, 
      author,
      "publicationDate", 
      "urlCoverPhoto", 
      "journalIssueNumber",
	  "journalPublished"
    FROM academic_forum.essentialInfo 
    INNER JOIN academic_forum.articles 
        ON articles."articleInfoId" = essentialInfo."infoId";

-- 2.4 Articles View (with Comments)
CREATE VIEW academic_forum."articlesCommentsView" AS
SELECT 
      "articleId", 
      title, 
      author,
      "publicationDate", 
      "urlCoverPhoto", 
      "journalIssueNumber",
	  "journalPublished",
	  content,
	  creator,
	  "creationDate"
    FROM academic_forum.essentialInfo 
    INNER JOIN academic_forum.articles 
        ON articles."articleInfoId" = essentialInfo."infoId"
	INNER JOIN academic_forum.comments
		ON  comments."commentInfoId" = essentialInfo."infoId";


----------------------------------------------
-------- Populate Database with data ---------
----------------------------------------------

-- 3.1 Essential Info
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(1, 'The Thursday Murder Club', 'Richard Osman', '2020-09-03', 'https://cdn.waterstones.com/bookjackets/large/9780/2419/9780241988268.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(2, 'The Vanishing Half ', 'Brit Bennett ', '2020-06-02', 'https://cdn.waterstones.com/bookjackets/large/9780/3497/9780349701479.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(3, 'The Bomber Mafia', 'Malcolm Gladwell', '2021-04-27', 'https://cdn.waterstones.com/override/v2/large/2928/3770/2928377055929.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(4, 'Camino Winds', 'John Grisham ', '2020-04-28', 'https://cdn.waterstones.com/bookjackets/large/9781/5293/9781529342499.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(5, 'Don Quixote de la Mancha', 'Miguel De Cervantes Saavedra', '2008-06-12', 'https://cdn.waterstones.com/bookjackets/large/9780/1995/9780199537891.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(6, 'The Well Gardened Mind', 'Sue Stuart-Smith ', '2020-04-16', 'https://cdn.waterstones.com/bookjackets/large/9780/0081/9780008100735.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(7, 'Surviving the Krays', 'David Teale ', '2021-03-18', 'https://cdn.waterstones.com/bookjackets/large/9781/5291/9781529106893.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(8, 'Harry Potter and the Order of the Phoenix', 'J. K. Rowling ', '2014-09-01', 'https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855690.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(9, 'Animal Farm: 60th Anniversary edition', 'George Orwell', '2020-04-15', 'https://cdn.waterstones.com/bookjackets/large/9781/8465/9781846553547.jpg');

INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(10, 'Design of super-tough and antibacterial PPR/nano-ZnO composites based on the excellent dispersion of ZnO particles', 'Chaojie Huang, Wenjie Mou, Liangzhi Zhao', '2021-04-13', 'https://onlinelibrary.wiley.com/cms/asset/fe0fd80e-5803-4566-b7d4-b1a75cde311e/pola.v59.10.cover.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(11, 'On the comprehension of application programming interface usability in game engines', 'Akhila Sri Manasa Venigalla, Sridhar Chimalakonda', '2021-05-13', 'https://onlinelibrary.wiley.com/cms/asset/85ef013f-ebe9-4b8c-b93e-18a8ac1309c4/spe.v51.6.cover.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(12, 'Optimization of medium-chain-length polyhydroxyalkanoate production by Pseudomonas putida KT2440 from co-metabolism of glycerol and octanoate', 'Ying Li, Songyuan Yang, Dayao Jin, Xiaoqiang Jia', '2020-10-06', 'https://onlinelibrary.wiley.com/cms/asset/bc05bfcc-9dc2-4a2c-9402-7f8718f1f316/cjce.v99.3.cover.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(13, 'Back contacts materials used in thin film CdTe solar cells—A review', 'Ralph Stephen Hall, Dan Lamb, Stuart James Curzon Irvine', '2021-02-10', 'https://onlinelibrary.wiley.com/cms/asset/53b359f6-cf66-4c39-9159-8ecbe9c6fec8/ese3.v9.5.cover.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(14, 'Structural analysis and design of irregular shaped footings subjected to eccentric loading', 'Mohammed S. Al-Ansari, Muhammad S. Afzal', '2020-09-14', 'https://onlinelibrary.wiley.com/cms/asset/011c5627-0a66-47b4-99fa-95ff1ec4bbae/eng2.v3.1.cover.jpg');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto")VALUES(15, 'Micro-computed tomography for the 3D time-resolved investigation of monodisperse droplet generation in a co-flow setup', 'Julia Schuler, Laura Maria Neuendorf, Kai Petersen, Norbert Kockmann', '2020-11-01', 'https://aiche.onlinelibrary.wiley.com/cms/asset/ddfdb4d3-b50a-4afc-8ff7-8883420a385e/aic.v67.2.cover.jpg');

-- 3.2 Comments
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(1, 'A little beacon of pleasure...SUCH FUN!', 'Kate Atkinson', '2020-10-03', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(2, 'So smart and funny. Deplorably good', 'Ian Rankin', '2020-11-19', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(3, 'Smart, compassionate, warm, moving and so VERY funny. I smiled a million times. This book will make a lot of people very, very happy', 'Marian Keyes', '2020-12-21', 1);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(4, 'Completely absorbing. Intricate prose. Deep characterization. Bennett exceeded my expectations with her second novel.', 'Roxane Pereira', '2020-10-09', 2);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(5, 'Is living in America really this . . . complicated and confusing? Why do people care so much about the color of someone’s skin? Life is funny sometimes. Also, does me questioning this and being genuinely confounded make me ignorant and insensitive? If so, I’ll shut up now.', 'Arini Mally', '2020-08-29', 2);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(6, 'An interesting read, about the American air corps bomber doctrine during the second world war.', 'David William', '2020-10-03', 3);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(7, 'I was very disappointed. When I read a Gladwell book, I expect to learn something I did not know or at least look at a situation differently than I would normally look at it. That is not this book.', 'Patrick Jason', '2021-04-30', 3);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(8, 'So..Grisham is one of the authors I always read. I loved the first Camino island book. And while I didn’t hate this one...it wasn’t nearly as good..', 'Amiee Rose', '2020-05-02', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(9, 'A ‘cozy’ style mystery that gets no-where fast. It is trying so hard to be quirky it misses on all fronts. If it did not have Grisham’s name on the cover I’m pretty sure the ratings would be lower.', 'Natalie Rickson', '2020-06-26', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(10, 'First book is much better.', 'Alex Givant', '2020-04-30', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(11, 'Not bad, but not up to Grisham`s standard', 'Lewis Weinstein', '2020-09-12', 4);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(12, 'The stars move toward an infinity not to be counted. Yet so accessible. They shift over making a space for me around the campfire as we listen to Cervantes’ narrator tell us tales nested within tales.', 'Stephen Paulo', '2019-11-19', 5);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(13, 'Exceptionally funny at times, I really enjoyed this.', 'Jazzy Lemon', '2019-02-09', 5);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(14, 'I loved this book. This is a fascinating, meticulously researched and at times deeply moving exploration of role of the garden and gardening in our lives.', 'Catherine Mccabe', '2020-07-26', 6);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(15, 'I`ve found my therapy through nature and gardening and this book explains how and why it`s so important for us to be surrounded by natural growing things and how we can take care of our minds.', 'Maribel Greig', '2020-07-15', 6);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(16, 'didn`t enjoy this book very much. In fact, I found it a bit of a struggle to make it through the first half.', 'Neave Farry', '2021-04-30', 7);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(17, 'Umbridge? More like Umbitch.That woman deserves to die. Painfully.', 'Melissa Lewis' , '2016-11-26', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(18, 'This book really made my CRY. And it was not just tears, I was CRYING out loud. If you`ve read it (or at least have seen the movie) you surely know that a very important character dies and GOD, it was heart wrenching, the tears came flowing like a waterfall. I didn`t want him to die :(...', 'Claudia Ramírez', '2014-04-21', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(19, 'SO many feels!!! I really love this book. The plot and world gets so complex, and I`m very happy to get answers and explanations at the end!This one was a crazy, scary, and ... frustrating.. (Umbridge) ride, but still so fun.', 'Kassidy Rolland', '2014-08-16', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(20, 'What else can anyone say at this point, this book is a masterpiece', 'Maria Campos', '2018-02-10', 8);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(21, 'Everybody should read it--and then make up their own minds.', 'Frederick V Watson', '2018-07-22', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(22, 'Love this book! This book is satiric and humourous. Orwell has depicted the political and civil issues of early Russia in a beautiful way.', 'Ujjawal Sureka', '2019-01-03', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(23, 'For a book that was first published nearly 80 years ago, Animal Farm still feels incredibly relevant. Clever, witty and at times, caustic, it’s a wonderfully well-crafted fable, satirizing the Soviet Union’s totalitarian regime. Although the book is largely based on stereotyped ideas, it presents a frighteningly stark picture of a political system of the rule of the many by the few.', 'Adam Silvera', '2016-05-25', 9);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(24, 'I feel that the article is missing organisation in the content.', 'Susan Wilde', '2018-03-17', 10);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(25, 'Very informative, nice work!', 'Oscar Menezes', '2018-03-19', 11);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(26, 'I feel that the academic_forumation date in this website is wrong.', 'Mike Ross', '2018-11-01', 12);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(27, 'Worst thing I have ever read so far.', 'Jane Levi', '2019-01-15', 12);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(28, 'Please, this was done by a kid! This content is simply rubbish.', 'Daniel Robert', '2019-04-13', 12);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(29, 'This is a very insightful article. Amazing Work!', 'Rita Mota', '2019-08-08', 13);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(30, 'Not what I was looking for.', 'Jamie Oliver', '2020-06-29', 14);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(31, 'Come one, you can do better than this!', 'Luis Mozzart', '2020-10-16', 14);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(32, 'LOL, what a joke', 'Wendy Ivis', '2020-12-24', 15);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(33, 'Not bad at all.', 'Louis Armstrong', '2021-02-09', 15);

-- 3.3 Books
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(1, 'Penguin Books Ltd', 1);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(2, 'Riverhead Books', 2);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(3, 'Penguin Books Ltd', 3);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(4, 'Hodder & Stoughton', 4);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(5, 'Oxford University Press', 5);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(6, 'HarperCollins Publishers', 6);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(7, 'Ebury Publishing', 7);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(8, 'Bloomsbury Publishing PLC', 8);
INSERT INTO academic_forum.books("bookId", publisher, "bookInfoId")VALUES(9, 'Vintage Publishing ', 9);

-- 3.4 Articles
INSERT INTO academic_forum.articles("articleId", "journalIssueNumber", "journalPublished", "articleInfoId")VALUES(1, 10, 'Journal of Polymer Science', 10);
INSERT INTO academic_forum.articles("articleId", "journalIssueNumber", "journalPublished", "articleInfoId")VALUES(2, 6, 'Software: Practice and Experience', 11);
INSERT INTO academic_forum.articles("articleId", "journalIssueNumber", "journalPublished", "articleInfoId")VALUES(3, 3, 'The Canadian Journal of Chemical Engineering', 12);
INSERT INTO academic_forum.articles("articleId", "journalIssueNumber", "journalPublished", "articleInfoId")VALUES(4, 5, 'Energy Science & Engineering', 13);
INSERT INTO academic_forum.articles("articleId", "journalIssueNumber", "journalPublished", "articleInfoId")VALUES(5, 1, 'Engineering Reports', 14);
INSERT INTO academic_forum.articles("articleId", "journalIssueNumber", "journalPublished", "articleInfoId")VALUES(6, 2, 'AIChE Journal', 15);

