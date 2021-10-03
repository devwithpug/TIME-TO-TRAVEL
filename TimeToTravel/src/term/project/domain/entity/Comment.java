package term.project.domain.entity;

import java.time.LocalDateTime;
import java.util.UUID;

public class Comment {

    private String postId;
    private String commentId;
    private String userId;
    private String description;
    private LocalDateTime createdAt;

    @Override
    public String toString() {
        return "Comment{" +
                "postId='" + postId + '\'' +
                ", commentId='" + commentId + '\'' +
                ", userId='" + userId + '\'' +
                ", description='" + description + '\'' +
                ", createdAt=" + createdAt +
                '}';
    }

    public Comment(String postId, String userId, String description) {
        this.commentId = UUID.randomUUID().toString();
        this.postId = postId;
        this.userId = userId;
        this.description = description;
        this.createdAt = LocalDateTime.now();
    }

    public Comment(String postId, String commentId, String userId, String description, LocalDateTime createdAt) {
        this.postId = postId;
        this.commentId = commentId;
        this.userId = userId;
        this.description = description;
        this.createdAt = createdAt;
    }

    public String getPostId() {
        return postId;
    }

    public void setPostId(String postId) {
        this.postId = postId;
    }

    public String getCommentId() {
        return commentId;
    }

    public void setCommentId(String commentId) {
        this.commentId = commentId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}
