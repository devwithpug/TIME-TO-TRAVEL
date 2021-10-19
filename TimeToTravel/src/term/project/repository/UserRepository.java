package term.project.repository;

import term.project.domain.User;
import term.project.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements Repository<User, String> {

    public UserRepository() {
    }

    @Override
    public User create(User entity) throws SQLException {

        String sql = "insert into user values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, entity.getUserId());
        stmt.setString(2, entity.getName());
        stmt.setString(3, entity.getEmail());
        stmt.setString(4, entity.getNickname());
        stmt.setString(5, entity.getPassword());
        stmt.setString(6, entity.getPhoneNumber());
        stmt.setString(7, entity.getPrefType());
        stmt.setString(8, entity.getPrefPreference());
        stmt.setString(9, entity.getPrefFlight());
        stmt.setString(10, entity.getPrefRoom());
        stmt.setString(11, entity.getPrefPlan());
        stmt.setString(12, entity.getPrefTransport());
        stmt.setString(13, entity.getPrefMeal());
        stmt.setString(14, entity.getPrefTendency());

        stmt.execute();
        return entity;
    }

    @Override
    public User getOneById(String id) throws SQLException {

        String sql = "select * from user u where u.user_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        ResultSet rs = stmt.executeQuery();

        return createUser(rs);
    }

    public User getOneByEmailAndPassword(String email, String password) throws SQLException {

        String sql = "select * from user u where u.email = ? and u.password = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        return createUser(rs);
    }

    public boolean isExistsByEmail(String email) throws SQLException {

        String sql = "select count(*) from user u where u.email = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        rs.next();
        int count = rs.getInt(1);

        return count != 0;
    }

    @Override
    public List<User> getAll() throws SQLException {

        String sql = "select * from user";

        Connection conn = DBUtil.getConn();
        Statement stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery(sql);
        List<User> result = new ArrayList<>();

        while (rs.next()) {
            User user = new User(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getString(10),
                    rs.getString(11),
                    rs.getString(12),
                    rs.getString(13),
                    rs.getString(14)
            );
            result.add(user);
        }
        return result;
    }

    public void update(String userId, String nickname, String password, String phoneNumber) throws SQLException {

        String sql = "update user set nickname = ?, password = ?, phone_number = ? where user_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, nickname);
        stmt.setString(2, password);
        stmt.setString(3, phoneNumber);
        stmt.setString(4, userId);
        stmt.execute();
    }

    public void updatePref(String userId, String prefType, String prefPreference, String prefFlight, String prefRoom, String prefPlan, String prefTransport, String prefMeal, String prefTendency) throws SQLException {

        String sql = "update user set pref_type = ?, pref_preference = ?, pref_flight = ?, pref_room = ?, pref_plan = ?, pref_transport = ?, pref_meal = ?, pref_tendency = ? where user_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, prefType);
        stmt.setString(2, prefPreference);
        stmt.setString(3, prefFlight);
        stmt.setString(4, prefRoom);
        stmt.setString(5, prefPlan);
        stmt.setString(6, prefTransport);
        stmt.setString(7, prefMeal);
        stmt.setString(8, prefTendency);
        stmt.setString(9, userId);
        stmt.execute();
    }

    @Override
    public void delete(String id) throws SQLException {

        String sql = "delete from user where user_id = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }

    private User createUser(ResultSet rs) throws SQLException {
        if (rs.next()) {
            return new User(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6),
                    rs.getString(7),
                    rs.getString(8),
                    rs.getString(9),
                    rs.getString(10),
                    rs.getString(11),
                    rs.getString(12),
                    rs.getString(13),
                    rs.getString(14)
            );
        }
        return null;
    }

}
