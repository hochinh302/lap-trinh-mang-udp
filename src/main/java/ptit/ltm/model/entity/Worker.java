package ptit.ltm.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Worker {
    public UUID id;
    public String name;
    public Integer birthYear;
    public String hometownId;
    public String hometownName;
    public BigDecimal salary;

    public Worker (ResultSet resultSet) throws SQLException {
        this.id = UUID.fromString(resultSet.getString("id"));
        this.name = resultSet.getString("name");
        this.birthYear = resultSet.getInt("birth_year");
        this.hometownId = resultSet.getString("hometown_id");
        this.hometownName = resultSet.getString("hometown_name");
        this.salary = resultSet.getBigDecimal("salary");
    }
}
