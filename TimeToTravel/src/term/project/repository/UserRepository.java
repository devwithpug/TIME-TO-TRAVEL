package term.project.repository;

import term.project.domain.entity.User;
import term.project.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserRepository implements Repository<User, String> {

    public UserRepository() {
    }

    @Override
    public User create(User entity) throws SQLException {

        String sql = "insert into user values (?, ?, ?, ?, ?, ?)";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, entity.getUserId());
        stmt.setString(2, entity.getName());
        stmt.setString(3, entity.getEmail());
        stmt.setString(4, entity.getNickname());
        stmt.setString(5, entity.getPassword());
        stmt.setString(6, entity.getPhoneNumber());

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

        if (rs.next()) {
            return new User(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6)
            );
        }
        return null;
    }

    public User getOneByEmailAndPassword(String email, String password) throws SQLException {

        String sql = "select * from user u where u.email = ? and u.password = ?";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, email);
        stmt.setString(2, password);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            return new User(
                    rs.getString(1),
                    rs.getString(2),
                    rs.getString(3),
                    rs.getString(4),
                    rs.getString(5),
                    rs.getString(6)
            );
        }
        return null;

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
                    rs.getString(6)
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

    @Override
    public void delete(String id) throws SQLException {

        String sql = "";

        Connection conn = DBUtil.getConn();
        PreparedStatement stmt = conn.prepareStatement(sql);
        stmt.setString(1, id);
        stmt.execute();
    }
}
