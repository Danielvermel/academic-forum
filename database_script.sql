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
    "description" character varying(2000) NOT NULL,
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
      "description",
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
      "description",
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
      "description",
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
      description,
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
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(1, 'The Thursday Murder Club', 'Richard Osman', '2020-09-03', 'https://cdn.waterstones.com/bookjackets/large/9780/2419/9780241988268.jpg', 'In a peaceful retirement village, four unlikely friends meet up once a week to investigate unsolved murders. But when a brutal killing takes place on their very doorstep, the Thursday Murder Club find themselves in the middle of their first live case. Elizabeth, Joyce, Ibrahim and Ron might be pushing eighty but they still have a few tricks up their sleeves. Can our unorthodox but brilliant gang catch the killer before it''s too late?');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(2, 'The Vanishing Half', 'Brit Bennett ', '2020-06-02', 'https://cdn.waterstones.com/bookjackets/large/9780/3497/9780349701479.jpg', 'The Vignes twin sisters will always be identical. But after growing up together in a small, southern black community and running away at age sixteen, it''s not just the shape of their daily lives that is different as adults, it''s everything: their families, their communities, their racial identities. Many years later, one sister lives with her black daughter in the same southern town she once tried to escape. The other passes for white, and her white husband knows nothing of her past. Still, even separated by so many miles and just as many lies, the fates of the twins remain intertwined. What will happen to the next generation, when their own daughters'' storylines intersect?');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(3, 'The Bomber Mafia', 'Malcolm Gladwell', '2019-04-27', 'https://cdn.waterstones.com/override/v2/large/2928/3770/2928377055929.jpg', 'In the years before the Second World War, in a sleepy air force base in central Alabama, a small group of renegade pilots put forth a radical idea. What if we made bombing so accurate that wars could be fought entirely from the air? What if we could make the brutal clashes between armies on the ground a thing of the past?');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(4, 'Camino Winds', 'John Grisham ', '2016-04-28', 'https://cdn.waterstones.com/bookjackets/large/9781/5293/9781529342499.jpg', 'Welcome back to Camino Island, where anything can happen—even a murder in the midst of a hurricane, which might prove to be the perfect crime ... Just as Bruce Cable’s Bay Books is preparing for the return of bestselling author Mercer Mann, Hurricane Leo veers from its predicted course and heads straight for the island.One of the apparent victims is Nelson Kerr, a friend of Bruce’s and an author of thrillers. But the nature of Nelson’s injuries suggests that the storm wasn’t the cause of his death...');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(5, 'Don Quixote de la Mancha', 'Miguel De Cervantes Saavedra', '2008-06-12', 'https://cdn.waterstones.com/bookjackets/large/9780/1995/9780199537891.jpg', 'Don Quixote has become so entranced by reading chivalric romances that he determines to become a knight-errant himself. In the company of his faithful squire, Sancho Panza, his exploits blossom in all sorts of wonderful ways. While Quixote''s fancy often leads him astray—he tilts at windmills, imagining them to be giants—Sancho acquires cunning and a certain sagacity. Sane madman and wise fool, they roam the world together, and together they have haunted readers'' imaginations for nearly four hundred years.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(6, 'The Well Gardened Mind', 'Sue Stuart-Smith ', '2020-04-16', 'https://cdn.waterstones.com/bookjackets/large/9780/0081/9780008100735.jpg', 'How can gardening relieve stress and help us look after our mental health? What lies behind the restorative power of the natural world? In a powerful combination of contemporary neuroscience, psychoanalysis and brilliant storytelling describes  the magic that many gardeners have known for years - working with nature can radically transform our health, wellbeing and confidence.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(7, 'Surviving the Krays', 'David Teale ', '2017-03-18', 'https://cdn.waterstones.com/bookjackets/large/9781/5291/9781529106893.jpg', 'David first met the Krays when he was seventeen years old. He was drawn into London''s underworld, and became Ronnie''s reluctant foot soldier, driver, errand boy. He was close to murder, and witnessed menaces and the increasingly psychotic behaviour of the most feared men in gangster land. After tireless research through newly released documents in the National Archives, and piecing previously classified information together with his own, first-hand knowledge of the time, David Teale uncovers the shocking new truth, revealed in this book for the first time.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(8, 'Harry Potter and the Order of the Phoenix', 'J. K. Rowling ', '2014-09-01', 'https://cdn.waterstones.com/bookjackets/large/9781/4088/9781408855690.jpg', 'There is a door at the end of a silent corridor. And it’s haunting Harry Pottter’s dreams. Why else would he be waking in the middle of the night, screaming in terror? Harry has a lot on his mind for this, his fifth year at Hogwarts: a Defense Against the Dark Arts teacher with a personality like poisoned honey; a big surprise on the Gryffindor Quidditch team; and the looming terror of the Ordinary Wizarding Level exams. But all these things pale next to the growing threat of He-Who-Must-Not-Be-Named - a threat that neither the magical government nor the authorities at Hogwarts can stop.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(9, 'Animal Farm: 60th Anniversary edition', 'George Orwell', '2018-04-15', 'https://cdn.waterstones.com/bookjackets/large/9781/8465/9781846553547.jpg', 'A farm is taken over by its overworked, mistreated animals. With flaming idealism and stirring slogans, they set out to create a paradise of progress, justice, and equality. Thus the stage is set for one of the most telling satiric fables ever penned –a razor-edged fairy tale for grown-ups that records the evolution from revolution against tyranny to a totalitarianism just as terrible. When Animal Farm was first published, Stalinist Russia was seen as its target. Today it is devastatingly clear that wherever and whenever freedom is attacked, under whatever banner, the cutting clarity and savage comedy of George Orwell’s masterpiece have a meaning and message still ferociously fresh.');

INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(10, 'Design of super-tough and antibacterial PPR/nano-ZnO composites based on the excellent dispersion of ZnO particles', 'Chaojie Huang, Wenjie Mou, Liangzhi Zhao', '2021-04-13', 'https://onlinelibrary.wiley.com/cms/asset/fe0fd80e-5803-4566-b7d4-b1a75cde311e/pola.v59.10.cover.jpg', 'Herein, polyvinyl pyrrolidone (PVP) dispersants are used to disperse and isolate zinc oxide (ZnO) particles. A high-pressure spray device is used to dry the dispersed nano-fillers quickly to achieve the structure of PVP chains wrapping and isolating ZnO particles. Scanning electron microscopy shows that most of the size of the agglomerated ZnO nanoparticles in polypropylene random (PPR, obtained by random copolymerization of propylene and ethylene) is maintained below 100 nm, and only a small amount of large agglomerates with a particle size less than 400 nm. An excellent dispersion of nano-ZnO fillers prepared by this method can greatly improve the toughness of PPR and endow it with good antibacterial properties. When the content of the ZnO nanoparticles is 3 wt%, the notched impact strength of PVZ3 increases to 48.85 kJ m−2 (unbroken), which is 3.6 times than that of pure PPR. In addition, 3 phr ZnO nanoparticles give PPR excellent antibacterial properties, with an antibacterial rate of 99.9% (Escherichia coli and Staphylococcus aureus). The value of antibacterial activity (E. coli) of PVZ3 reached more than 6.0, which is nearly three times that of PZ.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(11, 'On the comprehension of application programming interface usability in game engines', 'Akhila Sri Manasa Venigalla, Sridhar Chimalakonda', '2021-05-13', 'https://onlinelibrary.wiley.com/cms/asset/85ef013f-ebe9-4b8c-b93e-18a8ac1309c4/spe.v51.6.cover.jpg', 'Extensive development of games for various purposes including education and entertainment has resulted in increased development of game engines. Game engines are being used on a large scale as they support and simplify game development to a greater extent. Game developers using game engines are often compelled to use various application programming interfaces (APIs) of game engines in the process of game development. Thus, both quality and ease of development of games are greatly influenced by APIs defined in game engines. Hence, understanding API usability in game engines could greatly help in choosing better game engines among the ones that are available for game development and also could help developers in designing better game engines. In this article, we thus aim to evaluate API usability of 95 publicly available game engine repositories on GitHub, written primarily in C++ programming language. We test API usability of these game engines against the eight structural API usability metrics—AMNOI, AMNCI, AMGI, APXI, APLCI, AESI, ATSI, and ADI. We see this research as a first step toward the direction of improving usability of APIs in game engines. We present the results of the study, which indicate that about 25% of the game engines considered have minimal API usability, with respect to the considered metrics. It was observed that none of the considered repositories have ideal (all metric scores equal to 1) API usability, indicating the need for developers to consider API usability metrics while designing game engines.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(12, 'Optimization of medium-chain-length polyhydroxyalkanoate production by Pseudomonas putida KT2440 from co-metabolism of glycerol and octanoate', 'Ying Li, Songyuan Yang, Dayao Jin, Xiaoqiang Jia', '2020-10-06', 'https://onlinelibrary.wiley.com/cms/asset/bc05bfcc-9dc2-4a2c-9402-7f8718f1f316/cjce.v99.3.cover.jpg', 'In this study, the co-metabolism of glycerol and octanoate by Pseudomonas putida KT2440 significantly increased the production of medium-chain-length polyhydroxyalkanoate (mcl-PHA). This was achieved through optimization of various parameters such as substrate concentration, nitrogen concentration, and other mixing conditions related to dissolved oxygen level. Experiments were performed in shake flasks and 5 L fermenter with findings assessed through single factor analysis and response surface methodology. The optimal concentration of substrates to improve mcl-PHA production were determined to be 40 g glycerol/L, 12.23 g octanoate/L, and 1 g (NH4)2SO4/L. Indirect regulation of dissolved oxygen was achieved by controlling the mixing conditions such as the initial medium volume (50 mL) (shake flask experiment), agitation speed (500 rpm), and aeration rate (10 L/minutes) (fermenter experiment). Optimized process parameters resulted in an mcl-PHA titer of 8.47 g/L, which was significantly higher than that observed under un-optimized conditions (3.95 g/L). The response surface method can be efficiently used to determine the optimal level of several factors related to mcl-PHA production.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(13, 'Back contacts materials used in thin film CdTe solar cells—A review', 'Ralph Stephen Hall, Dan Lamb, Stuart James Curzon Irvine', '2021-02-10', 'https://onlinelibrary.wiley.com/cms/asset/53b359f6-cf66-4c39-9159-8ecbe9c6fec8/ese3.v9.5.cover.jpg', 'CdTe is the leading commercial thin film photovoltaic technology with current record laboratory efficiency (22.1%). However, there is much potential for progress toward the Shockley-Queisser limit (32%). The best CdTe devices have short-circuit current close to the limit but open-circuit voltage has much room for improvement. Back contact optimization is likely to play a key role in any improvement. Back contact material choice is also influenced by their applicability in more complex architectures such as bifacial and tandem solar cells, where high visible and/or near-infrared transparency is required in conjunction with their electrical properties. The CdTe research community has employed many back contact materials and processes to realize them. Excellent reviews of back contacts were published by McCandless and Sites (2011) and Kumar and Rao (2014). There have been numerous publications on CdTe back contacts since 2014. This review includes both recent and older literature to give a comprehensive picture. It includes a categorization of back contact interface materials into groups such as oxides, chalcogenides, pnictides, halides, and organics. The authors attempt to identify the more promising material groups. Attention is drawn to parallels with back contact materials used on other thin film photovoltaics such as perovskites and kesterites.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(14, 'Structural analysis and design of irregular shaped footings subjected to eccentric loading', 'Mohammed S. Al-Ansari, Muhammad S. Afzal', '2020-09-14', 'https://onlinelibrary.wiley.com/cms/asset/011c5627-0a66-47b4-99fa-95ff1ec4bbae/eng2.v3.1.cover.jpg', 'This article presents a simplified analytical model for designing irregular shaped reinforced concrete (RC) footings supporting square column and subjected to eccentric loading, that is, axial load P and biaxial moments, Mx in (x-x) axis and My in (y-y) axis, respectively. In this study, four design variations of footing sections are considered, namely, square, triangular, circular, and trapezoidal. Seven different footings (F-1 to F-7), each with a different loading condition, are used to analyze and design each of the selected irregular footings with the goal of getting the optimum footing section. The required reinforcing area of steel (As) is obtained using the SDM method in each selected footing which is then compared using finite element software (SAFE). The percentage difference of area of steel (As) for simplified method with the finite element software ranges within 1% to 13%. Moreover, the concrete volume results show that the circular and triangular footings prove to be the most economical footings followed by square and trapezoidal shaped footing sections. However, the results show that triangular shaped footings under heavy loads require a larger steel area (As) as in footing F-7, which is not economical for heavy loads.');
INSERT INTO academic_forum.essentialInfo("infoId", title, author, "publicationDate", "urlCoverPhoto", "description")VALUES(15, 'Micro-computed tomography for the 3D time-resolved investigation of monodisperse droplet generation in a co-flow setup', 'Julia Schuler, Laura Maria Neuendorf, Kai Petersen, Norbert Kockmann', '2020-11-01', 'https://aiche.onlinelibrary.wiley.com/cms/asset/ddfdb4d3-b50a-4afc-8ff7-8883420a385e/aic.v67.2.cover.jpg', 'Droplet generation in microfluidic devices has emerged as a promising approach for the design of highly controllable processes in the chemical and pharmaceutical industry. However, droplet generation is still not fully understood due to the complexity of the underlying physics. In this work, micro-computed tomography is applied to investigate droplet formation in a circular channel in a co-flow configuration at different flow conditions (Ca < 0.001). The application of an in-house developed scanning protocol assisted by comprehensive image processing allows for the time-resolved investigation of droplet formation. By tracking different droplet parameters (length, radii, volume, surface, Laplace pressure) the effect of flow conditions on droplet progression is determined. As characteristic for the squeezing regime, final droplet size was nearly independent of Ca for higher Ca tested. For lower Ca, the final droplet size increased with decreasing Ca, which points to the leaking regime that was recently introduced in the literature.');

-- 3.2 Comments
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(1, 'A little beacon of pleasure...SUCH FUN!', 'Kate Atkinson', '2020-10-03', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(2, 'So smart and funny. Deplorably good', 'Ian Rankin', '2020-11-19', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(3, 'Smart, compassionate, warm, moving and so VERY funny. I smiled a million times. This book will make a lot of people very, very happy', 'Marian Keyes', '2020-12-21', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(4, 'This is a typical ''very English'' whodunnit, featuring eccentric characters who come alive on the page: Elizabeth (ex-spy chief), Joyce (former nurse), Ibrahim (retired psychiatrist) and Ron (ex-trade union boss). These are folk who I soon came to care about, despite their individual flaws. They may be fictitious, but Richard effortlessly brings them to life, and gives each a unique personality. Despite murder being the theme running through this excellent novel, this is very much a cosy read. It''s clever, it''s sad, it''s moving in places, and it''s wickedly funny throughout.', 'Julie Silton', '2021-03-09', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(5, 'The wheel goes round and round, but it''s the same wheel, charming and witty, time after time. Very boring after the first two or three chapters. Not a very good novel, but a great idea for a novel that didn''t develop into one in spite of trying.', 'Danielle Bizmann', '2020-09-12', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(6, 'I thoroughly enjoyed this gentle murder mystery. The characterisations are wonderful and keep you engaged throughout as the story meanders along with many twists and turns. It is not a fast paced, action thriller, but is nevertheless an intriguing mystery told with sensitivity and humour. I can’t wait for the second book.', 'Jane Mudge', '2020-10-17', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(7, 'I struggle to relate the impressive reviews of this book with the volume that I have struggled through. Did they read the same book? The plot is juvenile and completely unrealistic. The writing style reminded me of the Enid Blyton books that I read as a child. Having laboured through half of the book, I have given up. I did not care enough to bother reading the end.', 'Tony Mulheran', '2020-12-20', 1);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(8, 'Featherweight stuff. Sunday evening fluff. Obviously written with a TV audience in mind.', 'Ivy Fore', '2021-01-14', 1);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(9, 'Completely absorbing. Intricate prose. Deep characterization. Bennett exceeded my expectations with her second novel.', 'Roxane Pereira', '2020-10-09', 2);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(10, 'Is living in America really this . . . complicated and confusing? Why do people care so much about the color of someone’s skin? Life is funny sometimes. Also, does me questioning this and being genuinely confounded make me ignorant and insensitive? If so, I’ll shut up now.', 'Arini Mally', '2020-08-29', 2);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(11, 'This is clearly a case off false advertising. I expected the book to convey a story on the dynamics identical twins raised in the racist south. THIS WAS NOT THE CORE OF THE BOOK. Instead it focused on the dynamics of the LGBTQ community. I have absolutely no interest in such matters. Thoroughly disappointed.', 'Ed Busa', '2020-06-25', 2);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(12, 'I agree with reviews I have read. This is a must read. I couldn’t put it down. I hope there are many more books to follow. What a talented writer. I have to go take a nap. I missed a whole night of sleep. I highly recommend this book.', 'Georgia Desmond', '2020-07-09', 2);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(13, 'This novel spans the full emotional spectrum, it brought me moments of sadness, anger, and tender delight, all of which I am truly grateful for. I needed this novel right now - and I believe many of us do. Please, do not hesitate to purchase this book.', 'Amanda Curley', '2020-09-04', 2);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(14, 'I really enjoyed the book once I got past the beginning, but was then disappointed by the end. At least two major characters, Stella and Jude, seem to be at major junctions in their lives, but nothing is resolved. I know that this reflects real life, and it is possible for a book to end too tidily, with too many loose ends tied up, but the Vanishing Half disappointingly goes too far the other way, and rather peters out.', 'Patrick Harris', '2021-05-02', 2);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(15, 'An interesting read, about the American air corps bomber doctrine during the second world war.', 'David William', '2020-10-03', 3);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(16, 'I was very disappointed. When I read a Gladwell book, I expect to learn something I did not know or at least look at a situation differently than I would normally look at it. That is not this book.', 'Patrick Jason', '2021-04-30', 3);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(17, 'Expensive for a very short book. About a third of it was taken up with acknowledgements at the end. Criticised british indiscriminate bombing when in the end the Americans did exactly the same???', 'James McCormick', '2021-05-14', 3);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(18, 'Excellent read, this is a book that every student of aerial warfare should read. It is a different view than preached by history books. Riveting insight into the minds of the ''Top Brass''. I can highly recommend this, it''s a must have addition to any historical library.', 'Johnny Bradshaw', '2020-05-07', 3);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(19, 'It''s actually a really hard to put down book, the narration is great, the material is excellent, even if you are not a fan of WW2 or War stories in general you should still read it because as the author states it ''It''s a story set in war not a war story'', and there''s definitely something to learn from the story apart from just the facts something that Malcolm Gladwell has tried to convey through this story and he''s done it pretty well.', 'Natalie Cork', '2020-01-01', 3);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(20, 'A lot of very intriguing anecdotes and learnings. Entertaining, but bordering on simplicity. A good book-as a pilot, very upset to see it was written that B-29s apparently needed a good tailwind to take off...(any plane needs a good a headwind...) which is a surprising comment to make in a book about aviation.', 'Mark Hall', '2020-12-12', 3);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(21, 'So..Grisham is one of the authors I always read. I loved the first Camino island book. And while I didn’t hate this one...it wasn’t nearly as good..', 'Amiee Rose', '2020-05-02', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(22, 'A ‘cozy’ style mystery that gets no-where fast. It is trying so hard to be quirky it misses on all fronts. If it did not have Grisham’s name on the cover I’m pretty sure the ratings would be lower.', 'Natalie Rickson', '2020-06-26', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(23, 'First book is much better.', 'Alex Givant', '2020-04-30', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(24, 'Not bad, but not up to Grisham''s standard', 'Lewis Weinstein', '2020-09-12', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(25, 'I have read every John Grisham book and this is a disappointment. It would be OK if you don''t compare it to some of the others he has written, like The Firm, Pelican Brief, A Time to Kill, but this book has no pace, a weak plot and absolutely no surprises/twists. It''s not a terrible book, it just isn''t, sadly, a great one!', 'Samuel McTier', '2020-06-01', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(26, 'If you have never read any John Grisham, don’t start with the Camino stories - read The Testament, The Firm, The Whistler, The Guardians or any of the Jake Brigance stories. This is a pool read. Not a classic Grisham although his style appears about two thirds the way through.', 'Karen Edmonds', '2018-04-06', 4);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(27, 'Very disappointed. I felt like I had returned to the era of the Hardy Boys Mysteries. This can’t have been written by John Grisham. I have always enjoyed his books and held him in high esteem as an author. This book sounds as though it were written by a college freshman who took creative writing as an elective.', 'Melanie Beams', '2018-04-29', 4);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(29, 'The stars move toward an infinity not to be counted. Yet so accessible. They shift over making a space for me around the campfire as we listen to Cervantes’ narrator tell us tales nested within tales.', 'Stephen Paulo', '2019-11-19', 5);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(30, 'Exceptionally funny at times, I really enjoyed this.', 'Jazzy Lemon', '2019-02-09', 5);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(31, 'It took time to get into the tale. The first third was a struggle as my mind adapted to the language and flow of the book. But after a while I got the rhythm, the humour and the joy this book brings. I was actually sad to end my travels with Don Quixote and Rancho Panza.', 'Tom Ryan', '2020-12-23', 5);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(32, 'You can believe the hype surrounding this, for it truly was an epic journey and one I will remember for the rest of my life the characters make the story feel real story and authentic it’s a living breathing tale that does not disappoint', 'Daniel Risha', '2018-07-05', 5);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(33, 'A must read book for all book worms... If u havent read it yet.. Then your life if a waste... Get some fresh air and read this... Lovely and hilarious.. tragic fall is there too.. But.. Well I won''t say.. Find urself... What happens when....', 'Paloma Miles', '2009-01-20', 5);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(34, 'You can believe the hype surrounding this, for it truly was an epic journey and one I will remember for the rest of my life the characters make the story feel real story and authentic it’s a living breathing tale that does not disappoint', 'Anna Keating', '2011-02-11', 5);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(35, 'I loved this book. This is a fascinating, meticulously researched and at times deeply moving exploration of role of the garden and gardening in our lives.', 'Catherine Mccabe', '2020-07-26', 6);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(36, 'I''ve found my therapy through nature and gardening and this book explains how and why it''s so important for us to be surrounded by natural growing things and how we can take care of our minds.', 'Maribel Greig', '2020-07-15', 6);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(37, 'If you know gardening makes you feel good this will explain why and if you don’t believe gardening has anything to offer you then this book might just change your mind (I hope so).', 'Milla Walsh', '2021-04-20', 6);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(38, 'I have always believed and knew gardening had so many health and mental benefits and now in this excellent book all is explained in a very readable, interesting and positive way. In our current covid-19 climate it is even more appropriate.', 'Natasha Sheffield', '2021-05-09', 6);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(39, 'This is a far-reaching exploration of gardening and the mind; and I enjoyed read it. But I sometimes wondered if something a little more focussed might have suited me better...', 'William Jordan', '2020-08-22', 6);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(40, 'didn''t enjoy this book very much. In fact, I found it a bit of a struggle to make it through the first half.', 'Neave Farry', '2021-04-30', 7);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(41, 'Good book to read have read many other books on the krays gives you a different inside to them.', 'Carla McLaughlin', '2021-05-08', 7);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(42, 'Not being steeped in Krays lore I found ''Surviving the Krays'' a fascinating read. I cannot comment on how it stacks up against the plethora of other accounts however there is no doubting David Teale''s insider credentials.', 'Nigel Bailey', '2021-04-21', 7);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(43, 'I was proved wrong,this book promises ''The Final Explosive Secret About The Krays'',and some very surprising,and worrying, facts do come to light for the first time . Without giving anything away David Teale''s book shows that there were people in roles that are supposed to protect the British public who were well-aware of what the Krays were doing but left them alone for their own reasons.', 'Tamara Bismati', '2021-03-18', 7);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(44, 'This is a great read,I lost day reading it from start to finish. There are quite a few new revelations .If ,like me,you thought you''d read all there is to know about the Krays and their entourage......you haven''t until you read this.', 'Tyler Kayleigh Hutchings', '2018-04-12', 7);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(45, 'Umbridge? More like Umbitch.That woman deserves to die. Painfully.', 'Melissa Lewis' , '2016-11-26', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(46, 'This book really made my CRY. And it was not just tears, I was CRYING out loud. If you''ve read it (or at least have seen the movie) you surely know that a very important character dies and GOD, it was heart wrenching, the tears came flowing like a waterfall. I didn''t want him to die :(...', 'Claudia Ramírez', '2014-04-21', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(47, 'SO many feels!!! I really love this book. The plot and world gets so complex, and I''m very happy to get answers and explanations at the end!This one was a crazy, scary, and ... frustrating.. (Umbridge) ride, but still so fun.', 'Kassidy Rolland', '2014-08-16', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(48, 'What else can anyone say at this point, this book is a masterpiece', 'Maria Campos', '2018-02-10', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(49, 'I am 78 but I read all the Potter books and love the characters. I had to keep up with the grandchildren, so thank you JK Rowling for writing such an interesting series. I love the imagination and inventiveness involved in these stories.', 'Beverley Johnson', '2018-01-31', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(50, 'This book is quite hefty but I got through it in about 4 days. Very much enjoyed it and makes you care about the characters.', 'Kate Wesley', '2020-08-15', 8);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(51, 'The plot is excellent with a great climatic battle and more than a little sorrow. The humour is plentiful, as you would expect from a Harry Potter book, with Ron getting most of the comic lines, and Fred and George causing most of the comedic mayhem.', 'Matt Paddon', '2016-06-03', 8);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(52, 'Everybody should read it--and then make up their own minds.', 'Frederick V Watson', '2018-07-22', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(53, 'Love this book! This book is satiric and humourous. Orwell has depicted the political and civil issues of early Russia in a beautiful way.', 'Ujjawal Sureka', '2020-10-03', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(54, 'For a book that was first published nearly 80 years ago, Animal Farm still feels incredibly relevant. Clever, witty and at times, caustic, it’s a wonderfully well-crafted fable, satirizing the Soviet Union’s totalitarian regime. Although the book is largely based on stereotyped ideas, it presents a frighteningly stark picture of a political system of the rule of the many by the few.', 'Adam Silvera', '2020-09-25', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(55, 'With the Election coming up, this is the book to read!! (1984 & Huxley''s Brave New World would be good too)!! Highly recommended classic!!', 'Gabriel Couttie', '2020-06-03', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(56, 'I don''t think George Orwell knew the impact, this novella was going to have on modern society in general. He is a genius and that''s too mild an expression to describe him.', 'Charlie Kimbert', '2021-02-16', 9);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(57, 'One does not need to know much about the Russian Revolution and Stalinism (that Orwell intended the tale to be a commentary about) to enjoy this book, because it could easily be about any totalitarian society or one that has aspirations to make life better for the people. And that''s what makes this work such a powerful classic.', 'Tom Turner', '2021-04-21', 9);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(58, 'I feel that the article is missing organisation in the content.', 'Susan Wilde', '2018-03-17', 10);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(59, 'The efficacy of the suggested dispersion method allows preparation of ZnO/PPR with remarkable antibacterial properties, which will definitely increase the range of applications for these devices.', 'Peter Knowles', '2019-07-07', 10);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(60, 'Seeing this novel use of high-pressure spray devices, I cannot help myself but wonder if this method could be implemented in stabilisation of nanoparticles with metal-organic frameworks.', 'James David Willock', '2020-04-30', 10);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(61, 'Very informative, nice work!', 'Oscar Menezes', '2018-03-19', 11);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(62, 'Being a game devleoper myself, I thorougly enjoyed the article - an indepth analysis of 95 game engines, with a lot of details on their performance and interfaces. I am thinking of revisiting some of my older engines and see how they rank, out of curiosity.', 'Connor McClain', '2019-08-18', 11);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(63, 'The response surface method suggested in this article could easily be applied to many other polyhydroxides. Looking forward to the follow-up publications of this group.', 'Mike Ross', '2018-11-01', 12);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(64, 'The optimisation of substrate concentrations and mixing conditions could have been rationalised better. Effect of temperature should have also been included.', 'Andrew Plats', '2019-10-10', 12);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(65, 'Worst thing I have ever read so far.', 'Jane Levi', '2019-01-15', 12);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(66, 'Please, this was done by a kid! This content is simply rubbish.', 'Daniel Robert', '2019-04-13', 12);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(67, 'This is a very insightful article. Amazing Work!', 'Rita Mota', '2019-08-08', 13);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(68, 'The review is very comprehensive, but fails to take into a consideration the over-estimations of the determined Shockley-Queisser limits for most of the materials. Some examples of this can be found in: DOI:10.1103/PhysRevB.99.035154.', 'Leonardo Berlusconi', '2019-12-13', 13);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(69, 'Discussion on the impact of the back contact materials on the nature and energetics of the band gap shoudl be extended. Otherwise, very nice review.', 'Nelson Dzade', '2019-03-15', 13);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(70, 'Not what I was looking for.', 'Jamie Oliver', '2020-06-29', 14);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(71, 'Many of the simplifications included in the model should be justified in more depth and supported by mathematical proofs and/or external references.', 'Luis Mozzart', '2020-10-16', 14);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(72, 'Triangular footings are not economical for heavy loads, as these require larger steel area as in footing F-7 under such loads. Authors should comment on the financial aspects of their findings/', 'Michael Hingham', '2020-05-19', 14);

INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(73, 'The analysis of the effect of capillary number and volume flow rate ratio on the volume of the resulting droplet showed that the final droplet increases with flow rate ratio and decreases with the capillary number, but no proof is given. This should be improved.', 'Wendy Ivis', '2020-12-24', 15);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(74, 'A comparison of data with that presented by Yao et al (https://doi.org/10.1002/aic.15889) could be of significance for further implementation of this work.', 'Louis Armstrong', '2021-02-09', 15);
INSERT INTO academic_forum.comments("commentId", content, creator, "creationDate", "commentInfoId")VALUES(75, 'The suitability of the presented methodology for the time-resolved 3D investigation of droplet formation would enrich the discussion section.', 'Francesca Ferrando', '2021-04-18', 15);


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

