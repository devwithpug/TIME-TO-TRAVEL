package term.project.util;

import java.sql.*;
import java.time.LocalDateTime;

public class DBUtil {

    private static final String driver = "org.mariadb.jdbc.Driver";
    private static final String url = "jdbc:mariadb://"+System.getProperty("url")+"/timetotravel";
    private static final String user = System.getProperty("username");
    private static final String pwd = System.getProperty("credentials");

    private static Connection conn;

    public static Connection getConn() throws SQLException {

        try {
            Class.forName(driver);

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (conn == null) {
            conn = DriverManager.getConnection(url, user, pwd);
        } else if (conn.isClosed()) {
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

    public static PreparedStatement createPostStatement(
            String sql, String postId, String authorId, String title, String description, LocalDateTime createdAt, Integer postNum, String fileName
    ) throws SQLException {
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
        stmt.setInt(7, postNum);
        stmt.setString(8, fileName);

        return stmt;
    }
}
