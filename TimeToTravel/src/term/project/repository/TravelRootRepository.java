package term.project.repository;

import term.project.domain.TravelRoot;
import term.project.util.DBUtil;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TravelRootRepository implements Repository<TravelRoot, String> {

    public TravelRootRepository() {
    }

    @Override
    public TravelRoot create(TravelRoot entity) throws SQLException {

        String sql = "insert into travel_root values(?, ?, ?, ?, ?, ?, ?, ?)";

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
    public TravelRoot getOneById(String id) throws SQLException {

        String sql = "select * from travel_root t where t.post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new TravelRoot(
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
    public List<TravelRoot> getAll() throws SQLException {

        String sql = "select * from review";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        return getTravelRoots(rs);
    }

    public Integer getAllCount() throws SQLException {

        String sql = "select count(*) from review";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        rs.next();
        return rs.getInt(1);
    }

    public List<TravelRoot> getAllByPaging(int limit, int offset) throws SQLException {

        String sql = "select * from travel_root limit ? offset ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, limit);
        stmt.setInt(2, offset);
        ResultSet rs = stmt.executeQuery();

        return getTravelRoots(rs);
    }

    private List<TravelRoot> getTravelRoots(ResultSet rs) throws SQLException {
        List<TravelRoot> result = new ArrayList<>();

        while (rs.next()) {
            TravelRoot travelRoot = new TravelRoot(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8)
            );
            result.add(travelRoot);
        }
        return result;
    }

    public void update(String postId, String title, String description) throws SQLException {

        String sql = "update travel_root set title = ?, description = ? where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setString(3, postId);
        stmt.execute();
    }

    @Override
    public void delete(String id) throws SQLException {

        String sql = "delete from travel_root where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

    public void deleteByUserId(String id) throws SQLException {

        String sql = "delete from travel_root where author_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }
}
