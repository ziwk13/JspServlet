package dto;

public class UserDTO {
  
  private int uid;
  private String userId;
  private String pw;
  private String userName;
  private String birthDate;
  private String gender;
  private String email;
  private String phone;
  private String place;

  public int getUid() {
    return uid;
  }

  public void setUid(int uid) {
    this.uid = uid;
  }

  public String getUserId() {
    return userId;
  }

  public void setUserId(String userId) {
    this.userId = userId;
  }

  public String getPw() {
    return pw;
  }

  public void setPw(String pw) {
    this.pw = pw;
  }

  public String getUserName() {
    return userName;
  }

  public void setUserName(String userName) {
    this.userName = userName;
  }

  public String getbirthDate() {
    return birthDate;
  }

  public void setDate(String date) {
    this.birthDate = date;
  }

  public String getGender() {
    return gender;
  }

  public void setGender(String gender) {
    this.gender = gender;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getPlace() {
    return place;
  }

  public void setPlace(String place) {
    this.place = place;
  }

  @Override
  public String toString() {
    return "UserDTO [uid=" + uid + ", userId=" + userId + ", pw=" + pw + ", userName=" + userName + ", birthDate=" + birthDate
        + ", gender=" + gender + ", email=" + email + ", phone=" + phone + ", place=" + place + "]";
  }

}
