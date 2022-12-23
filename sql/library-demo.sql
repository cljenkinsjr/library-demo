create database library_demo;

use library_demo;

CREATE TABLE IF NOT EXISTS campus (
    campus_id INT AUTO_INCREMENT PRIMARY KEY,
    location VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS hashtag (
    hashtag_id INT AUTO_INCREMENT PRIMARY KEY,
    hashtag_name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)  ENGINE=INNODB;

alter table book add column campus_id int; 
alter table book add foreign key(campus_id) references campus(campus_id);

alter table campus drop foreign key campus_ibfk_1;
alter table campus drop book_id;

CREATE TABLE IF NOT EXISTS book_author (
    book_author_id INT AUTO_INCREMENT PRIMARY KEY,
	book_id int,
    author_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key (book_id) references book(book_id) on update cascade on delete cascade,
    foreign key (author_id) references author(author_id) on update cascade on delete cascade
)  ENGINE=INNODB;

CREATE TABLE IF NOT EXISTS book_hashtag (
    book_hashtag_id INT AUTO_INCREMENT PRIMARY KEY,
	book_id int,
    hashtag_id int,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    foreign key (book_id) references book(book_id) on update cascade on delete cascade,
    foreign key (hashtag_id) references hashtag(hashtag_id) on update cascade on delete cascade
)  ENGINE=INNODB;

insert into campus(location) values('Columbus');
insert into campus(location) values('CLeveland');
insert into campus(location) values('Cincinnati');
insert into campus(location) values('Toledo');

select * from campus;

insert into author(first_name, last_name) values("Kathy","Sierra");
insert into author(first_name, last_name) values("Burt", "Bates");
insert into author(first_name, last_name) values("Kent", "Beck");
insert into author(first_name, last_name) values("Martin", "Fowler");
insert into author(first_name, last_name) values("Micah", "Martin");

insert into book(first_name, last_name) values("Kathy","Sierra");
insert into book(first_name, last_name) values("Burt", "Bates");
insert into author(first_name, last_name) values("Kent", "Beck");
insert into author(first_name, last_name) values("Martin", "Fowler");
insert into author(first_name, last_name) values("Micah", "Martin");

insert into hashtag(hashtag_name) values("A great book to learn Java with");
insert into hashtag(hashtag_name) values("The first book on TDD and still one of the best");
insert into hashtag(hashtag_name) values("The first book to catalog the many refactorings available to address code smells");
insert into hashtag(hashtag_name) values("A classic book refactored for C#");

insert into book(title) values("Head First Java");
insert into book(title) values("TDD By Example");
insert into book(title) values("Refactoring");
insert into book(title) values("Agile Principles, Patterns and Practices in C#");

select * from book;
select * from hashtag;

update book set campus_id = 1 where book_id = 1;
update book set campus_id = 1 where book_id = 2;
update book set campus_id = 1 where book_id = 3;
update book set campus_id = 2 where book_id = 4;

insert into book_author(book_id, author_id) values(1,1);
insert into book_author(book_id, author_id) values(1,2);
insert into book_author(book_id, author_id) values(2,3);
insert into book_author(book_id, author_id) values(3,4);
insert into book_author(book_id, author_id) values(4,5);

insert into book_hashtag(book_id, hashtag_id) values(1,1);
insert into book_hashtag(book_id, hashtag_id) values(2,2);
insert into book_hashtag(book_id, hashtag_id) values(3,3);
insert into book_hashtag(book_id, hashtag_id) values(4,4);

SELECT book.book_id, book.title FROM book JOIN  book_author ON book_author.author_id = 3 and book_author.author_id = book.book_id;
