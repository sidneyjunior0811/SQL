CREATE DATABASE livrariaDB
GO

USE livrariaDB
GO

CREATE TABLE tb_livraria_livros
(
	livroID INT IDENTITY(1,1) PRIMARY KEY, 
	nome VARCHAR(255),
	imagemURL VARCHAR(255),
	descricao VARCHAR(MAX),
	quantidadePaginas INT,
	editora VARCHAR(255),
	preco FLOAT,
	dataPublicacao DATE
)
GO

CREATE TABLE tb_livraria_autores
(
	autorID INT IDENTITY(1,1) PRIMARY KEY,
	autor VARCHAR(255),
	sobre VARCHAR(MAX)
)
GO

CREATE TABLE tb_livraria_livro_autor
(
	livroID INT,
	autorID INT

	PRIMARY KEY(livroID, autorID),
	FOREIGN KEY(livroID) REFERENCES tb_livraria_livros(livroID),
	FOREIGN KEY(autorID) REFERENCES tb_livraria_autores(autorID)
)
GO

CREATE TABLE tb_livraria_usuario
(
	usuarioID INT IDENTITY(1,1) PRIMARY KEY,
	nome VARCHAR(255),
	imagemURL VARCHAR(255)
)
GO

CREATE TABLE tb_livraria_review
(
	reviewID INT IDENTITY (1,1) PRIMARY KEY,
	usuarioID INT,
	livroID INT,
	comentario VARCHAR(255),
	rating INT,
	dataComentario DATE

	FOREIGN KEY (usuarioID) REFERENCES tb_livraria_usuario (usuarioID),
	FOREIGN KEY (livroID) REFERENCES tb_livraria_livros (livroID)
)
GO

CREATE TABLE tb_livraria_imagens
(
	imagemID INT IDENTITY(1,1) PRIMARY KEY,
	reviewID INT,
	imagemURL VARCHAR(255)

	FOREIGN KEY (reviewID) REFERENCES tb_livraria_review (reviewID)
)
GO

CREATE TABLE tb_livraria_genero
(
	generoID INT IDENTITY(1,1) PRIMARY KEY,
	genero VARCHAR(255)
)
GO

CREATE TABLE tb_livraria_livro_genero
(
	generoID INT,
	livroID INT

	PRIMARY KEY (generoID, livroID),
	FOREIGN KEY (generoID) REFERENCES tb_livraria_genero (generoID),
	FOREIGN KEY (livroID)  REFERENCES tb_livraria_livros (livroID)
)
GO

CREATE TABLE tb_livraria_idiomas
(
	idiomaID INT IDENTITY(1,1) PRIMARY KEY,
	idioma VARCHAR(255)
)
GO

CREATE TABLE tb_livraria_livro_idioma
(
	livroID INT,
	idiomaID INT

	PRIMARY KEY ( livroID, idiomaID),
	FOREIGN KEY (livroID) REFERENCES tb_livraria_livros (livroID),
	FOREIGN KEY (idiomaID) REFERENCES tb_livraria_idiomas (idiomaID)
)
GO

-- POPULATE DATA

INSERT INTO tb_livraria_livros
VALUES
(
	'Harry Potter and the Prisoner of Azkaban',
	'https://m.media-amazon.com/images/I/71NaVwWsRDL._SY342_.jpg',
	'The third book in the Harry Potter series, illustrated in brilliant full color by MinaLima and featuring eight exclusive interactive elements, including the Marauder’s Map and more!
	Return to Hogwarts in this stunning edition of Harry Potter and the Prisoner of Azkaban. J.K. Rowling’s complete and unabridged text is accompanied by full-color illustrations on nearly every page and eight paper-engineered interactive elements: Readers will explore the Knight Bus, reveal the Grim in a teacup, spin the Time-Turner, and more.

Designed and illustrated by MinaLima ― the award-winning studio behind the graphic style of the Harry Potter films ― this keepsake edition is the perfect gift for Harry Potter fans of all ages, a beautiful addition to any collector’s bookshelf, and an enchanting way to share this beloved series with a new generation of readers.',
	480,
	'Scholastic Inc.',
	25.43,
	'2023-10-03'
)
GO

INSERT INTO tb_livraria_autores
VALUES
(
	'J. K. Rowling',
	'MINALIMA is an award-winning graphic design studio founded by Miraphora Mina and Eduardo Lima, best known for establishing the graphic style of the Harry Potter film series. Since founding their London-based studio in 2009, they continue to be involved in the Wizarding World franchise through numerous creative partnerships, from publishing to theme park design. More recently, Miraphora and Eduardo have returned to the Wizarding World as graphic designers of the Fantastic Beasts film series. MinaLima is internationally renowned for telling stories through design. The studio has brought its distinctive, colorful, and interactive style to Harry Potter and the Sorcerer’s Stone as well as their MinaLima Classics series, reimagining a collection of much-loved tales including Peter Pan, The Secret Garden, and Pinocchio.
J.K. ROWLING is the author of the enduringly popular, era-defining Harry Potter seven-book series, which have sold over 600 million copies in 85 languages, been listened to as audiobooks for over one billion hours and made into eight smash hit movies. To accompany the series, she wrote three short companion volumes for charity, including Fantastic Beasts and Where to Find Them, which went on to inspire a new series of films featuring Magizoologist Newt Scamander. Harry’s story as a grown-up was continued in a stage play, Harry Potter and the Cursed Child, which J.K. Rowling wrote with playwright Jack Thorne and director John Tiffany.

In 2020, she returned to publishing for younger children with the fairy tale The Ickabog, the royalties for which she donated to her charitable trust, Volant, to help charities working to alleviate the social effects of the Covid-19 pandemic. Her latest children’s novel, The Christmas Pig, was published in 2021.

J.K. Rowling has received many awards and honours for her writing, including for her detective series written under the name Robert Galbraith. She supports a wide number of humanitarian causes through Volant, and is the founder of the international children’s care reform charity Lumos. J.K. Rowling lives in Scotland with her family.'
)
GO

INSERT INTO tb_livraria_usuario
VALUES
(
	'Custeemade',
	'https://images-na.ssl-images-amazon.com/images/S/amazon-avatars-global/a0c3b8bc-5f1c-4ac7-ad30-5ae4e0112b6f._CR0,0,440,440_SX48_.jpg'
)
GO

INSERT INTO tb_livraria_livro_autor
VALUES
(1,1)

INSERT INTO tb_livraria_review
VALUES
(
	1,
	1,
	'As a lifelong Harry Potter superfan, I was so excited to get my hands on MinaLima is newest interactive papercraft edition. Their creative details blew me away! The moving Marauder is Map footsteps and Grim peeking out from the teacup were pure magic.',
	5,
	GETDATE()
)
GO

INSERT INTO tb_livraria_imagens
VALUES
(
	1,
	'https://m.media-amazon.com/images/I/816b0+3hNxL._SY88.jpg'
)
GO

INSERT INTO tb_livraria_genero
VALUES
	('Fantasia'),
	('Aventura'),
	('Terror')
GO

INSERT INTO tb_livraria_livro_genero
VALUES (1,1),(2,1)
GO

INSERT INTO	tb_livraria_idiomas
VALUES
('ingles'),
('portugues'),
('espanhol')
GO

INSERT INTO tb_livraria_livro_idioma
VALUES
(1,1),
(1,2)

