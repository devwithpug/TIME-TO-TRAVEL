package term.project.repository;

import term.project.domain.Comment;
import term.project.util.DBUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class CommentRepository implements Repository<Comment, String> {

    public CommentRepository() {
        try {
            DBUtil.getConn();
        } catch (SQLException e) {
        }
    }

    @Override
    public Comment create(Comment entity) throws SQLException {

        String sql = "insert into comment values(?, ?, ?, ?, ?)";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, entity.getPostId());
        stmt.setString(2, entity.getCommentId());
        stmt.setString(3, entity.getUserId());
        stmt.setString(4, entity.getDescription());
        stmt.setObject(5, entity.getCreatedAt());

        stmt.execute();
        return entity;
    }

    @Override
    public Comment getOneById(String id) throws SQLException{

        String sql = "select * from comment c where c.comment_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new Comment(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class)
            );
        }
        return null;
    }

    @Override
    public List<Comment> getAll() throws SQLException {

        String sql = "select * from comment";

        Connection conn = DBUtil.getConn();
        Statement statement = conn.createStatement();
        ResultSet rs = statement.executeQuery(sql);
        return getComments(rs);
    }

    public List<Comment> getAllByPostId(String id) throws SQLException {

        String sql = "select * from comment c where c.post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();
        return getComments(rs);
    }

    private List<Comment> getComments(ResultSet rs) throws SQLException {
        List<Comment> result = new ArrayList<>();

        while (rs.next()) {
            Comment comment = new Comment(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class)
            );
            result.add(comment);
        }
        return result;
    }

    public void update(String commentId, String description) throws SQLException {

        String sql = "update comment set description = ? where comment_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, description);
        stmt.setString(2, commentId);
        stmt.execute();
    }

    @Override
    public void delete(String id) throws SQLException {

        String sql = "delete from comment where comment_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

    public void deleteByPostId(String id) throws SQLException {

        String sql = "delete from comment where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

    public void deleteByUserId(String id) throws SQLException {

        String sql = "delete from comment where author_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

}
