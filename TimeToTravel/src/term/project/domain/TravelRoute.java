package term.project.domain;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.UUID;

public class TravelRoute {

    private String postId;
    private String authorId;
    private String title;
    private String description;
    private LocalDateTime createdAt;
    private Integer viewCount = 0;
    private Integer postNum;
    private String fileName;

    private String destination;
    private Integer day;
    private LocalDate departureDate;
    private LocalDate arrivalDate;
    private Integer expense;
    private Integer person;
    private String travelType;

    @Override
    public String toString() {
        return "TravelRoot{" +
                "postId='" + postId + '\'' +
                ", authorId='" + authorId + '\'' +
                ", title='" + title + '\'' +
                ", createdAt=" + createdAt +
                ", viewCount=" + viewCount +
                ", postNum=" + postNum +
                ", fileName=" + fileName +
                '}';
    }

    public void plusViewCount() {
        this.viewCount++;
    }

    public TravelRoute(String authorId, String title, String description, Integer postNum, String fileName, String destination, Integer day, LocalDate departureDate, LocalDate arrivalDate, Integer expense, Integer person, String travelType) {
        this.postId = UUID.randomUUID().toString();
        this.authorId = authorId;
        this.title = title;
        this.description = description;
        this.createdAt = LocalDateTime.now();
        this.viewCount = 0;
        this.postNum = postNum;
        this.fileName = fileName;
        this.destination = destination;
        this.day = day;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.expense = expense;
        this.person = person;
        this.travelType = travelType;
    }

    public TravelRoute(String postId, String authorId, String title, String description, LocalDateTime createdAt, Integer viewCount, Integer postNum, String fileName, String destination, Integer day, LocalDate departureDate, LocalDate arrivalDate, Integer expense, Integer person, String travelType) {
        this.postId = postId;
        this.authorId = authorId;
        this.title = title;
        this.description = description;
        this.createdAt = createdAt;
        this.viewCount = viewCount;
        this.postNum = postNum;
        this.fileName = fileName;
        this.destination = destination;
        this.day = day;
        this.departureDate = departureDate;
        this.arrivalDate = arrivalDate;
        this.expense = expense;
        this.person = person;
        this.travelType = travelType;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getAuthorId() {
        return authorId;
    }

    public void setAuthorId(String authorId) {
        this.authorId = authorId;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Integer getViewCount() {
        return viewCount;
    }

    public void setViewCount(Integer viewCount) {
        this.viewCount = viewCount;
    }

    public Integer getPostNum() {
        return postNum;
    }

    public void setPostNum(Integer postNum) {
        this.postNum = postNum;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public Integer getDay() {
        return day;
    }

    public void setDay(Integer day) {
        this.day = day;
    }

    public LocalDate getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(LocalDate departureDate) {
        this.departureDate = departureDate;
    }

    public LocalDate getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(LocalDate arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public Integer getExpense() {
        return expense;
    }

    public void setExpense(Integer expense) {
        this.expense = expense;
    }

    public Integer getPerson() {
        return person;
    }

    public void setPerson(Integer person) {
        this.person = person;
    }

    public String getTravelType() {
        return travelType;
    }

    public void setTravelType(String travelType) {
        this.travelType = travelType;
    }
}
