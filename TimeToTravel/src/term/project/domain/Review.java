package term.project.domain.entity;

import java.time.LocalDateTime;
import java.util.UUID;

public class Review {

    private String postId;
    private String authorId;
    private String title;
    private String description;
    private LocalDateTime createdAt;
    private Integer viewCount = 0;
    private Integer postNum;
    private String fileName;

    @Override
    public String toString() {
        return "Review{" +
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

    public Review(String authorId, String title, String description, Integer postNum, String fileName) {
        this.postId = UUID.randomUUID().toString();
        this.authorId = authorId;
        this.title = title;
        this.description = description;
        this.createdAt = LocalDateTime.now();
        this.viewCount = 0;
        this.postNum = postNum;
        this.fileName = fileName;
    }

    public Review(String postId, String authorId, String title, String description, LocalDateTime createdAt, Integer viewCount, Integer postNum, String fileName) {
        this.postId = postId;
        this.title = title;
        this.authorId = authorId;
        this.description = description;
        this.createdAt = createdAt;
        this.viewCount = viewCount;
        this.postNum = postNum;
        this.fileName = fileName;
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
}
