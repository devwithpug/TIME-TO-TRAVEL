package term.project.repository;

import java.sql.SQLException;
import java.util.List;


public interface Repository<T, K>{
    // CREATE
    T create(T entity) throws SQLException;

    // READ
    T getOneById(K id) throws SQLException;
    List<T> getAll() throws SQLException;

    // DELETE
    void delete(K id) throws SQLException;

}
