package term.project.domain;

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
    private String prefType;
    private String prefPreference;
    private String prefFlight;
    private String prefRoom;
    private String prefPlan;
    private String prefTransport;
    private String prefMeal;
    private String prefTendency;

    @Override
    public String toString() {
        return "User{" +
                "userId='" + userId + '\'' +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", nickname='" + nickname + '\'' +
                ", phoneNumber='" + phoneNumber + '\'' +
                ", prefType='" + prefType + '\'' +
                ", prefPreference='" + prefPreference + '\'' +
                ", prefFlight='" + prefFlight + '\'' +
                ", prefRoom='" + prefRoom + '\'' +
                ", prefPlan='" + prefPlan + '\'' +
                ", prefTransport='" + prefTransport + '\'' +
                ", prefMeal='" + prefMeal + '\'' +
                ", prefTendency='" + prefTendency + '\'' +
                '}';
    }

    public User(String name, String email, String nickname, String password, String phoneNumber, String prefType, String prefPreference, String prefFlight, String prefRoom, String prefPlan, String prefTransport, String prefMeal, String prefTendency) {
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
        this.prefType = prefType;
        this.prefPreference = prefPreference;
        this.prefFlight = prefFlight;
        this.prefRoom = prefRoom;
        this.prefPlan = prefPlan;
        this.prefTransport = prefTransport;
        this.prefMeal = prefMeal;
        this.prefTendency = prefTendency;
    }

    public User(String userId, String name, String email, String nickname, String password, String phoneNumber, String prefType, String prefPreference, String prefFlight, String prefRoom, String prefPlan, String prefTransport, String prefMeal, String prefTendency) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.nickname = nickname;
        this.password = password;
        this.phoneNumber = phoneNumber;
        this.prefType = prefType;
        this.prefPreference = prefPreference;
        this.prefFlight = prefFlight;
        this.prefRoom = prefRoom;
        this.prefPlan = prefPlan;
        this.prefTransport = prefTransport;
        this.prefMeal = prefMeal;
        this.prefTendency = prefTendency;
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

    public String getPrefType() {
        return prefType;
    }

    public void setPrefType(String prefType) {
        this.prefType = prefType;
    }

    public String getPrefPreference() {
        return prefPreference;
    }

    public void setPrefPreference(String prefPreference) {
        this.prefPreference = prefPreference;
    }

    public String getPrefFlight() {
        return prefFlight;
    }

    public void setPrefFlight(String prefFlight) {
        this.prefFlight = prefFlight;
    }

    public String getPrefRoom() {
        return prefRoom;
    }

    public void setPrefRoom(String prefRoom) {
        this.prefRoom = prefRoom;
    }

    public String getPrefPlan() {
        return prefPlan;
    }

    public void setPrefPlan(String prefPlan) {
        this.prefPlan = prefPlan;
    }

    public String getPrefTransport() {
        return prefTransport;
    }

    public void setPrefTransport(String prefTransport) {
        this.prefTransport = prefTransport;
    }

    public String getPrefMeal() {
        return prefMeal;
    }

    public void setPrefMeal(String prefMeal) {
        this.prefMeal = prefMeal;
    }

    public String getPrefTendency() {
        return prefTendency;
    }

    public void setPrefTendency(String prefTendency) {
        this.prefTendency = prefTendency;
    }
}
