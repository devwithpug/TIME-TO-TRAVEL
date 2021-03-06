package term.project.repository;

import term.project.domain.TravelRoute;
import term.project.util.DBUtil;

import java.sql.*;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

public class TravelRouteRepository implements Repository<TravelRoute, String> {

    public TravelRouteRepository() {
        try {
            DBUtil.getConn();
        } catch (SQLException e) {
        }
    }

    @Override
    public TravelRoute create(TravelRoute entity) throws SQLException {

        String sql = "insert into travel_route values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

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
        stmt.setString(9, entity.getDestination());
        stmt.setInt(10, entity.getDay());
        stmt.setObject(11, entity.getDepartureDate());
        stmt.setObject(12, entity.getArrivalDate());
        stmt.setInt(13, entity.getExpense());
        stmt.setInt(14, entity.getPerson());
        stmt.setString(15, entity.getTravelType());

        stmt.execute();
        return entity;
    }

    @Override
    public TravelRoute getOneById(String id) throws SQLException {

        String sql = "select * from travel_route t where t.post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new TravelRoute(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getInt(10),
                    rs.getObject(11, LocalDate.class),
                    rs.getObject(12, LocalDate.class),
                    rs.getInt(13),
                    rs.getInt(14),
                    rs.getString(15)
            );
        }
        return null;
    }

    @Override
    public List<TravelRoute> getAll() throws SQLException {

        String sql = "select * from travel_route";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        return getTravelRoutes(rs);
    }

    public Integer getAllCount() throws SQLException {

        String sql = "select count(*) from travel_route";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);

        rs.next();
        return rs.getInt(1);
    }

    public List<TravelRoute> getAllByPaging(int limit, int offset) throws SQLException {

        String sql = "select * from travel_route t order by t.created_at desc limit ? offset ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, limit);
        stmt.setInt(2, offset);
        ResultSet rs = stmt.executeQuery();

        return getTravelRoutes(rs);
    }

    private List<TravelRoute> getTravelRoutes(ResultSet rs) throws SQLException {
        List<TravelRoute> result = new ArrayList<>();

        while (rs.next()) {
            TravelRoute travelRoute = new TravelRoute(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getObject(5, LocalDateTime.class),
                    rs.getInt(6),
                    rs.getInt(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getInt(10),
                    rs.getObject(11, LocalDate.class),
                    rs.getObject(12, LocalDate.class),
                    rs.getInt(13),
                    rs.getInt(14),
                    rs.getString(15)
            );
            result.add(travelRoute);
        }
        return result;
    }

    public void update(String postId, String title, String description, String destination, Integer day, LocalDate departureDate, LocalDate arrivalDate, Integer expense, Integer person, String travelType) throws SQLException {

        String sql = "update travel_route set " +
                "title = ?, description = ?, destination = ?, day = ?, departure_date = ?, arrival_date = ?, expense = ?, person = ?, type = ? " +
                "where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, title);
        stmt.setString(2, description);
        stmt.setString(3, destination);
        stmt.setInt(4, day);
        stmt.setObject(5, departureDate);
        stmt.setObject(6, arrivalDate);
        stmt.setInt(7, expense);
        stmt.setInt(8, person);
        stmt.setString(9, travelType);
        stmt.setString(10, postId);
        stmt.execute();
    }

    public void updateViewCount(String postId, Integer count) throws SQLException {

        String sql = "update travel_route set view_count = ? where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setInt(1, count);
        stmt.setString(2, postId);
        stmt.execute();
    }

    @Override
    public void delete(String id) throws SQLException {

        String sql = "delete from travel_route where post_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

    public void deleteByUserId(String id) throws SQLException {

        String sql = "delete from travel_route where author_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }
}
