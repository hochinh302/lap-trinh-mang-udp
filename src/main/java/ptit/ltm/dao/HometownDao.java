package ptit.ltm.dao;

import ptit.ltm.dao.base.IDAO;
import ptit.ltm.model.entity.Hometown;
import ptit.ltm.utils.DataProviderUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class HometownDao implements IDAO<UUID, Hometown> {
    ResultSet resultSet = null;
    private static HometownDao instance;

    private HometownDao() {}

    public static HometownDao getInstance() {
        if (instance == null)
            instance = new HometownDao();
        return instance;
    }

    @Override
    public List<Hometown> getAll() {
        String sql = "SELECT t.id, t.code, t.name FROM hometown t";
        ResultSet rs = DataProviderUtil.excuteQuery(sql);

        List<Hometown> hometownList = new ArrayList<>();
        if (rs != null) {
            try {
                while (rs.next()) {
                    Hometown hometown = new Hometown(rs);
                    hometownList.add(hometown);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return hometownList;
    }

    @Override
    public Boolean add(Hometown entity) {
        return null;
    }
}
