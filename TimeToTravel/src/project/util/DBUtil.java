package project.util;

import java.sql.*;
import java.time.LocalDateTime;

public class DBUtil {

    private static final String driver = "org.mariadb.jdbc.Driver";
    private static final String url = "jdbc:mariadb://152.70.253.138:3306/timetotravel";
    private static final String user = "root";
    private static final String pwd = "@chmG306360";

    private static Connection conn;

    public static Connection getConn() throws SQLException {
        try {
            Class.forName(driver);


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (conn == null) {
            conn = DriverManager.getConnection(url, user, pwd);
        }

        return conn;
    }

    public static void close() throws SQLException {
        if (conn != null) {
            if (!conn.isClosed()) {
                conn.close();
            }
        }
    }

    public static PreparedStatement createPostStatement(String sql, String postId, String authorId, String title, String description, LocalDateTime createdAt) throws SQLException {
        if (conn == null) {
            conn = DriverManager.getConnection(url, user, pwd);
        }
        PreparedStatement stmt = conn.prepareStatement(sql);

        stmt.setString(1, postId);
        stmt.setString(2, authorId);
        stmt.setString(3, title);
        stmt.setString(4, description);
        stmt.setObject(5, createdAt);
        stmt.setInt(6, 0);

        return stmt;
    }
}
