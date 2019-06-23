create table AccountType(
	AccountTypeID int not null primary key auto_increment,
    Name varchar(255) not null unique,
    ReaderRight tinyint,
    JournalistRight tinyint,
    AdminRight tinyint,
    AccountMng tinyint,
    AccountTypeMng tinyint,
    ArticleMng tinyint,
    CommentMng tinyint,
    BookmarkMng tinyint,
    FeedbackMng tinyint,
    ImageMng tinyint
);
drop table AccountType;
select* from AccountType;
INSERT INTO `AccountType` (`AccountTypeID`, `Name`, `ReaderRight`, `JournalistRight`, `AdminRight`, `AccountMng`, `AccountTypeMng`, `ArticleMng`, `CommentMng`, `BookmarkMng`, `FeedbackMng`, `ImageMng`) VALUES (NULL, 'reader', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `AccountType` (`AccountTypeID`, `Name`, `ReaderRight`, `JournalistRight`, `AdminRight`, `AccountMng`, `AccountTypeMng`, `ArticleMng`, `CommentMng`, `BookmarkMng`, `FeedbackMng`, `ImageMng`) VALUES (NULL, 'journalist', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `AccountType` (`AccountTypeID`, `Name`, `ReaderRight`, `JournalistRight`, `AdminRight`, `AccountMng`, `AccountTypeMng`, `ArticleMng`, `CommentMng`, `BookmarkMng`, `FeedbackMng`, `ImageMng`) VALUES (NULL, 'admin', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1');



create table Account(
	AccountID int not null primary key auto_increment,
    Username varchar(255) not null unique,
    Password varchar(255) not null,
    FirstName varchar(255) not null,
    LastName varchar(255) not null,
    Email varchar(255) not null unique,
    Phone varchar(11) not null unique,
    DateCreated datetime,
    LastModified datetime,
    AccountTypeID int not null,
	Valid tinyint default 1,
    ProfilePicture varchar(255) null,
    constraint AT_fk foreign key (AccountTypeID) references AccountType(AccountTypeID)
);

alter table Account
add column ProfilePicture varchar(255) null;



select* from Account;
delete from Account;
INSERT INTO `Account` (`AccountID`, `Username`, `Password`, `FirstName`, `LastName`, `Email`, `Phone`, `DateCreated`, `LastModified`, `AccountTypeID`, `Valid`) VALUES (NULL, 'eihinim', '1', 'Hieu', 'Nguyen', 'hieunguyenvn98@gmail.com', '123456789', NULL, NULL, '4', '1');



create table Category(
	CategoryID int not null primary key auto_increment,
    Name nvarchar(255) not null,
    ParentCategoryID int null default null,
    constraint Cat_fk foreign key (ParentCategoryID) references Category(CategoryID)
);


create table Article(
	ArticleID int not null primary key auto_increment,
    Heading varchar(255) not null,
    ShortDescription text,
    Content text,
    CategoryID int not null,
    SubCategoryID int null,
    JournalistID int not null,
    Censored tinyint default 0,
    Draft tinyint default 0,
    Trash tinyint default 0,
    DateCreated datetime,
    LastModified datetime,
    constraint Article_fk foreign key (JournalistID) references Account(AccountID)
);

create table Comment(
	CommentID int not null auto_increment,
    ArticleID int not null,
    RepliedCommentID int null default 0,
    AccountID int not null,
    Content text,
    NoOfLikes int default 0,
    Level int not null,
    DateCreated datetime,
    constraint Comment_pk primary key(CommentID,ArticleID),
    constraint Comment_Article_fk foreign key (ArticleID) references Article(ArticleID),
    constraint Comment_Acc_fk foreign key (AccountID) references Account(AccountID)
);


INSERT INTO `Comment` (`CommentID`, `ArticleID`, `RepliedCommentID`, `AccountID`, `Content`, `NoOfLikes`, `Level`, `DateCreated`) VALUES
(1, 38, 0, 91, 'Very goooood!!!!', 10, 1, NULL),
(2, 38, 0, 105, 'A hi hi hi hi hi hi !!!', 12, 1, NULL),
(3, 38, 0, 13, 'I am groooooooot!!!', 1, 2, NULL),
(4, 38, 0, 56, 'I am iron mannnnn!!!!!!', 8, 2, NULL);


create table Bookmark(
	BookmarkID int not null auto_increment,
    AccountID int not null,
    ArticleID int not null,
    Title varchar(255) not null,
    DateCreated datetime,
    constraint Bookmark_pk primary key (BookmarkID, AccountID),
    constraint BM_acc_fk foreign key (AccountID) references Account(AccountID),
    constraint BM_article_fk foreign key (ArticleID) references Article(ArticleID)
);

create table Message(
	MessageID int not null auto_increment,
    ArticleID int not null,
    SenderID int not null,
    ReceiverID int null,
    RepliedMessageID int null,
    Content text,
    DateCreated datetime,
	constraint Msg_pk primary key(MessageID),
    constraint Msg_Article_fk foreign key (ArticleID) references Article(ArticleID),
    constraint Msg_Sender_fk foreign key (SenderID) references Account(AccountID),
    constraint Msg_Receiver_fk foreign key (ReceiverID) references Account(AccountID),
    constraint Msg_RepliedMsg_fk foreign key (RepliedMessageID) references Message(MessageID)
);


create table Image(
	ImageID int not null primary key auto_increment,
	Source varchar(255),
    ArticleID int null,
    AccountID int null,
    DateCreated datetime,
    constraint Img_article_fk foreign key (ArticleID) references Article(ArticleID),
    constraint Img_Acc_fk foreign key (AccountID) references Account(AccountID)
)


show triggers;

drop trigger auto_insert_date_account;
drop trigger auto_insert_date_article;
drop trigger auto_insert_date_comment;
drop trigger auto_insert_date_bookmark;
drop trigger auto_insert_date_feedback;
drop trigger auto_insert_date_image;

DELIMITER $$

create trigger auto_insert_date_account
before insert on Account
for each row
	begin
    set NEW.DateCreated = now();
    set NEW.LastModified = now();
	end;
    $$
 DELIMITER

DELIMITER $$

create trigger auto_insert_date_article
before insert on Article
for each row
begin
    set NEW.DateCreated = now();
    set NEW.LastModified = now();
end;
$$
DELIMITER

drop trigger auto_insert_date_comment;

create trigger auto_insert_date_comment
before insert on Comment
for each row
    set NEW.DateCreated = now();


create trigger auto_insert_date_bookmark
before insert on Bookmark
for each row
    set NEW.DateCreated = now();


create trigger auto_insert_date_message
before insert on Message
for each row
    set NEW.DateCreated = now();


create trigger auto_insert_date_image
before insert on Image
for each row
    set NEW.DateCreated = now();


DELIMITER ;

DELIMITER $$;


drop trigger auto_modify_date_account;
drop trigger auto_modify_date_article;

create trigger auto_modify_date_account
before update on Account
for each row
	set NEW.LastModified = now();

create trigger auto_modify_date_article
before update on Article
for each row
	set NEW.LastModified = now();
$$
DELIMITER ;

DELIMITER $$;

DROP TRIGGER 	delete_commentafter;




