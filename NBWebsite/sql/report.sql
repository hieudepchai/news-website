select z.ArticleID, z.Heading, z.ShortDescription, z.Content, z.Author, z.Category, c.Name as SubCategory, z.LastModified
 from (
select a.ArticleID, a.Heading, a.ShortDescription, a.Content, CONCAT(ac.FirstName," ", ac.LastName) as Author, c.Name as Category, SubCategoryID, Censored, 
DATE_FORMAT(a.LastModified,'%d/%m/%Y') as LastModified
 from Article a, Category c, Account ac where a.CategoryID = c.CategoryID and a.JournalistID = ac.AccountID and a.Censored=1) z
 left join Category c
 on  z.SubCategoryID = c.CategoryID
 ORDER BY Category asc, SubCategory asc, LastModified desc;

select a.ArticleID, a.Heading, a.ShortDescription, a.Content, CONCAT(ac.FirstName," ", ac.LastName) as Author, a.CategoryID, SubCategoryID, DATE_FORMAT(a.LastModified,'%d/%m/%Y') as LastModified
 from Article a, Account ac where  a.JournalistID = ac.AccountID and a.Censored=1
 ORDER BY a.CategoryID asc, a.SubCategoryID asc, a.LastModified desc;
 
 select distinct a.AccountID, CONCAT(a.FirstName," ", a.LastName) as Author, a.ProfilePicture  from Comment c, Account a where c.AccountID = a.AccountID and c.ArticleID=38;
 
 
 update  Article
 set Censored=1
 where Censored=0;
 
 select* from Comment where ArticleID = 38 order by Level asc, RepliedCommentID asc, DateCreated asc;
 
 select CommentID from Comment where AccountID = 105 order by DateCreated desc limit 1;
 
 ALTER DATABASE news_minhhieu CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
 
 select* from Account;
 select b.BookmarkID, b.AccountID, b.ArticleID, a.Heading, a.CategoryID, a.SubCategoryID, b.Title, b.DateCreated from Bookmark b, Article a where b.ArticleID = a.ArticleID;
 insert into Bookmark(AccountID,ArticleID,Title) values(56,38,'Popular');