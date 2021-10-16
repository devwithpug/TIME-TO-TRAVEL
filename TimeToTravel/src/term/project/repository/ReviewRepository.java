package term.project.repository;

import term.project.domain.entity.Review;
import term.project.util.DBUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class ReviewRepository implements Repository<Review, String> {

    public ReviewRepository() {
    }

    @Override
    public Review create(Review entity) throws SQLException {

        String sql = "insert into review values(?, ?, ?, ?, ?, ?, ?, ?)";

        PreparedStatement stmt = DBUtil.createPostStatement(
                sql,
                entity.getPostId(),
                entity.getAuthorId(),
                entity.getTitle(),
                entity.getDescription(),
                entity.getCreatedAt(),
                entity.getPostNum(),
                entity.getFileName()
        );

        stmt.execute();
        return entity;
    }

    @Override
    public Review getOneById(String id) throws SQLException {

        String sql = "select * from review r where r.post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new Review(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8)
            );
        }
        return null;
    }

    @Override
    public List<Review> getAll() throws SQLException {

        String sql = "select * from review";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        return getReviews(rs);
    }

    public Integer getAllCount() throws SQLException {

        String sql = "select count(*) from review";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        rs.next();
        return rs.getInt(1);
    }

    public List<Review> getAllByPaging(int limit, int offset) throws SQLException {

        String sql2 = "select * from review r order by r.created_at desc limit ? offset ?";

        Connection conn = DBUtil.getConn();

        PreparedStatement stmt2 = conn.prepareStatement(sql2);
        stmt2.setInt(1, limit);
        stmt2.setInt(2, offset);
        ResultSet rs2 = stmt2.executeQuery();

        return getReviews(rs2);
    }

    private List<Review> getReviews(ResultSet rs) throws SQLException {
        List<Review> result = new ArrayList<>();

        while (rs.next()) {
            Review review = new Review(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8)
            );
            result.add(review);
        }
        return result;
    }

    public void update(String postId, String title, String description) throws SQLException {

        String sql = "update review set title = ?, description = ? where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setString(3, postId);
        stmt.execute();
    }

    public void updateViewCount(String postId, Integer count) throws SQLException {

        String sql = "update review set view_count = ? where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, count);
        stmt.setString(2, postId);
        stmt.execute();
    }

    @Override
    public void delete(String id) throws SQLException {

        String sql = "delete from review where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

    public void deleteByUserId(String id) throws SQLException {

        String sql = "delete from review where author_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }
}
