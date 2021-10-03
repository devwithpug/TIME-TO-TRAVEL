package project.domain.entity;

import java.time.LocalDateTime;

public class Review {

    private String postId;
    private String authorId;
    private String title;
    private String description;
    private LocalDateTime createdAt;
    private Integer viewCount = 0;

    @Override
    public String toString() {
        return "Review{" +
                "postId='" + postId + '\'' +
                ", authorId='" + authorId + '\'' +
                ", createdAt=" + createdAt +
                ", title='" + title + '\'' +
                ", viewCount=" + viewCount +
                '}';
    }

    public void plusViewCount() {

    }

    public Review(String postId, String title, String authorId, String description, LocalDateTime createdAt, Integer viewCount) {
        this.postId = postId;
        this.title = title;
        this.authorId = authorId;
        this.description = description;
        this.createdAt = createdAt;
        this.viewCount = viewCount;
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
}
