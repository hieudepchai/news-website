/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.bean;

/**
 *
 * @author Admin
 */
public class AccountBean {

    private int AccountID;
    private String Username;
    private String Password;
    private String FirstName;
    private String LastName;
    private String Email;
    private String Phone;
    private String DateCreated;
    private String LastModified;
    private int AccountTypeID;
    private String ProfilePicture;
    private int Valid;
    private String FullName;

    public AccountBean(int AccountID, String ProfilePicture, String FullName) {
        this.AccountID = AccountID;
        this.ProfilePicture = ProfilePicture;
        this.FullName = FullName;
    }

    public AccountBean(int AccountID, String Username, String Password, String FirstName, String LastName, String Email, String Phone, String DateCreated, String LastModified, int AccountTypeID, String ProfilePicture, int Valid, String FullName) {
        this.AccountID = AccountID;
        this.Username = Username;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.Phone = Phone;
        this.DateCreated = DateCreated;
        this.LastModified = LastModified;
        this.AccountTypeID = AccountTypeID;
        this.ProfilePicture = ProfilePicture;
        this.Valid = Valid;
        this.FullName = FullName;
    }

    public AccountBean() {
    }

    public AccountBean(AccountBean acc) {
        this.AccountID = acc.getAccountID();
        this.Username = acc.getUsername();
        this.Password = acc.getPassword();
        this.FirstName = acc.getFirstName();
        this.LastName = acc.getLastName();
        this.Email = acc.getEmail();
        this.Phone = acc.getPhone();
        this.DateCreated = acc.getDateCreated();
        this.LastModified = acc.getLastModified();
        this.AccountTypeID = acc.getAccountTypeID();
        this.ProfilePicture = acc.getProfilePicture();
        this.Valid = acc.getValid();
        this.FullName = acc.getFullName();

    }

    public String getFullName() {
        return FullName;
    }

    public void setFullName(String FullName) {
        this.FullName = FullName;
    }

    public AccountBean(int AccountID, String Username, String Password, String FirstName, String LastName, String Email, String Phone, String DateCreated, String LastModified, int AccountTypeID, String ProfilePicture, int Valid) {
        this.AccountID = AccountID;
        this.Username = Username;
        this.Password = Password;
        this.FirstName = FirstName;
        this.LastName = LastName;
        this.Email = Email;
        this.Phone = Phone;
        this.DateCreated = DateCreated;
        this.LastModified = LastModified;
        this.AccountTypeID = AccountTypeID;
        this.ProfilePicture = ProfilePicture;
        this.Valid = Valid;
    }

    public int getAccountID() {
        return AccountID;
    }

    public String getUsername() {
        return Username;
    }

    public String getPassword() {
        return Password;
    }

    public String getFirstName() {
        return FirstName;
    }

    public String getLastName() {
        return LastName;
    }

    public String getEmail() {
        return Email;
    }

    public String getPhone() {
        return Phone;
    }

    public String getDateCreated() {
        return DateCreated;
    }

    public String getLastModified() {
        return LastModified;
    }

    public int getAccountTypeID() {
        return AccountTypeID;
    }

    public String getProfilePicture() {
        return ProfilePicture;
    }

    public int getValid() {
        return Valid;
    }

    public void setAccountID(int AccountID) {
        this.AccountID = AccountID;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public void setFirstName(String FirstName) {
        this.FirstName = FirstName;
    }

    public void setLastName(String LastName) {
        this.LastName = LastName;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public void setDateCreated(String DateCreated) {
        this.DateCreated = DateCreated;
    }

    public void setLastModified(String LastModified) {
        this.LastModified = LastModified;
    }

    public void setAccountTypeID(int AccountTypeID) {
        this.AccountTypeID = AccountTypeID;
    }

    public void setValid(int Valid) {
        this.Valid = Valid;
    }

    public void setProfilePicture(String ProfilePicture) {
        this.ProfilePicture = ProfilePicture;
    }
}
