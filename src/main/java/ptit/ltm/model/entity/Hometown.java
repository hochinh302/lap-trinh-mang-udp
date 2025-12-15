package ptit.ltm.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Hometown {
    private UUID id;
    private String code;
    private String name;

    public Hometown(ResultSet rs) throws SQLException {
        this.id = UUID.fromString(rs.getString("id"));
        this.code = rs.getString("code");
        this.name = rs.getString("name");
    }
}
