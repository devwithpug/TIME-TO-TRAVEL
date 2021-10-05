package term.project.domain.entity;

import java.time.LocalDateTime;
import java.util.UUID;

public class TravelRoot {

    private String postId;
    private String authorId;
    private String title;
    private String description;
    private LocalDateTime createdAt;
    private Integer viewCount = 0;
    private Integer postNum;

    @Override
    public String toString() {
        return "TravelRoot{" +
                "postId='" + postId + '\'' +
                ", authorId='" + authorId + '\'' +
                ", title='" + title + '\'' +
                ", createdAt=" + createdAt +
                ", viewCount=" + viewCount +
                ", postNum=" + postNum +
                '}';
    }

    public void plusViewCount() {
        this.viewCount++;
    }

    public TravelRoot(String authorId, String title, String description, Integer postNum) {
        this.postId = UUID.randomUUID().toString();
        this.authorId = authorId;
        this.title = title;
        this.description = description;
        this.createdAt = LocalDateTime.now();
        this.viewCount = 0;
        this.postNum = postNum;
    }

    public TravelRoot(String postId, String authorId, String title, String description, LocalDateTime createdAt, Integer viewCount, Integer postNum) {
        this.postId = postId;
        this.title = title;
        this.authorId = authorId;
        this.description = description;
        this.createdAt = createdAt;
        this.viewCount = viewCount;
        this.postNum = postNum;
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
}
