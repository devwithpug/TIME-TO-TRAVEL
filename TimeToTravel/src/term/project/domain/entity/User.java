package term.project.domain.entity;

import java.util.UUID;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class User {

    private String userId;
    private String name;
    private String email;
    private String nickname;
    private String password;
    private String phoneNumber;

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                '}';
    }

    public User(String name, String email, String nickname, String password, String phoneNumber) {
        this.userId = UUID.randomUUID().toString();
        this.name = name;
        this.email = email;
        this.nickname = nickname;
        this.password = password;

        Matcher validPhoneNumber = Pattern.compile("\\d{3}-\\d{4}-\\d{4}").matcher(phoneNumber);
        if (validPhoneNumber.matches()) {
            phoneNumber = String.join("", phoneNumber.split("-"));
        }

        this.phoneNumber = phoneNumber;
    }

    public User(String userId, String name, String email, String nickname, String password, String phoneNumber) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.nickname = nickname;
        this.password = password;
        this.phoneNumber = phoneNumber;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }
}
