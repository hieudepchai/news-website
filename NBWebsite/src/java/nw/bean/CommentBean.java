
package nw.bean;

/**
 *
 * @author Admin
 */
public class CommentBean {

    private int CommentID;
    private int ArticleID;
    private String Heading;
    private int JournalistID;
    private int RepliedCommentID;
    private int AccountID;
    private String FirstName;
    private String LastName;
    private String ProfilePicture;
    private String Content;
    private int NoOfLikes;
    private int Level;
    private String DateCreated;
    private int CategoryID;
    private int SubCategoryID;

    public CommentBean() {
    }

    public CommentBean(int CommentID, int ArticleID, int AccountID, String Content, String DateCreated, String Heading, int CategoryID, int SubCategoryID) {
        this.CommentID = CommentID;
        this.ArticleID = ArticleID;
        this.AccountID = AccountID;
        this.Content = Content;
        this.DateCreated = DateCreated;
        this.Heading = Heading;
        this.CategoryID = CategoryID;
        this.SubCategoryID = SubCategoryID;
    }

    public CommentBean(int CommentID, int ArticleID, String Heading, int JournalistID, int CategoryID, int SubCategoryID, int RepliedCommentID, int AccountID, String FirstName, String LastName, String ProfilePicture, String Content, int NoOfLikes, int Level, String DateCreated) {
        this.CommentID = CommentID;
        this.ArticleID = ArticleID;
        this.Heading = Heading;
        this.JournalistID = JournalistID;
        this.CategoryID = CategoryID;
        this.SubCategoryID = SubCategoryID;
        this.RepliedCommentID = RepliedCommentID;
        this.AccountID = AccountID;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.ProfilePicture = ProfilePicture;
        this.Content = Content;
        this.NoOfLikes = NoOfLikes;
        this.Level = Level;
        this.DateCreated = DateCreated;
    }

    public CommentBean(int CommentID, int ArticleID, int RepliedCommentID, int AccountID, String Content, int NoOfLikes, int Level, String DateCreated) {
        this.CommentID = CommentID;
        this.ArticleID = ArticleID;
        this.RepliedCommentID = RepliedCommentID;
        this.AccountID = AccountID;
        this.Content = Content;
        this.NoOfLikes = NoOfLikes;
        this.Level = Level;
        this.DateCreated = DateCreated;
    }

    public CommentBean(int ArticleID, int RepliedCommentID, int AccountID, String Content, int NoOfLikes, int Level) {
        this.ArticleID = ArticleID;
        this.RepliedCommentID = RepliedCommentID;
        this.AccountID = AccountID;
        this.Content = Content;
        this.NoOfLikes = NoOfLikes;
        this.Level = Level;
    }

    public int getRepliedCommentID() {
        return RepliedCommentID;
    }

    public void setRepliedCommentID(int RepliedCommentID) {
        this.RepliedCommentID = RepliedCommentID;
    }

    public int getCommentID() {
        return CommentID;
    }

    public void setCommentID(int CommentID) {
        this.CommentID = CommentID;
    }

    public int getArticleID() {
        return ArticleID;
    }

    public void setArticleID(int ArticleID) {
        this.ArticleID = ArticleID;
    }

    public String getHeading() {
        return Heading;
    }

    public void setHeading(String Heading) {
        this.Heading = Heading;
    }

    public int getJournalistID() {
        return JournalistID;
    }

    public void setJournalistID(int JournalistID) {
        this.JournalistID = JournalistID;
    }

    public int getAccountID() {
        return AccountID;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public String getFirstName() {
        return FirstName;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public String getProfilePicture() {
        return ProfilePicture;
    }

    public void setProfilePicture(String ProfilePicture) {
        this.ProfilePicture = ProfilePicture;
    }

    public String getContent() {
        return Content;
    }

    public void setContent(String Content) {
        this.Content = Content;
    }

    public int getNoOfLikes() {
        return NoOfLikes;
    }

    public void setNoOfLikes(int NoOfLikes) {
        this.NoOfLikes = NoOfLikes;
    }

    public int getLevel() {
        return Level;
    }

    public void setLevel(int Level) {
        this.Level = Level;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }

    public int getCategoryID() {
        return CategoryID;
    }

    public void setCategoryID(int CategoryID) {
        this.CategoryID = CategoryID;
    }

    public int getSubCategoryID() {
        return SubCategoryID;
    }

    public void setSubCategoryID(int SubCategoryID) {
        this.SubCategoryID = SubCategoryID;
    }
}

