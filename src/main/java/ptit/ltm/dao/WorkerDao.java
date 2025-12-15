package ptit.ltm.dao;

import ptit.ltm.dao.base.IDAO;
import ptit.ltm.model.entity.Worker;
import ptit.ltm.utils.DataProviderUtil;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class WorkerDao implements IDAO<UUID, Worker> {
    ResultSet resultSet = null;
    private static WorkerDao instance;

    private WorkerDao() {}

    public static WorkerDao getInstance() {
        if (instance == null)
            instance = new WorkerDao();
        return instance;
    }


    @Override
    public List<Worker> getAll() {
        String sql = "SELECT w.*, h.name as hometown_name FROM worker w JOIN hometown h ON w.hometown_id = h.code ORDER BY w.name";
        ResultSet rs = DataProviderUtil.excuteQuery(sql);
        List<Worker> workerList = new ArrayList<>();
        if (rs != null) {
            try {
                while (rs.next()) {
                    Worker worker = new Worker(rs);
                    workerList.add(worker);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return workerList;
    }


    @Override
    public Boolean add(Worker entity) {
        UUID uuid = UUID.randomUUID();
        String sql = "INSERT INTO worker (id, name, birth_year, hometown_id, salary) values (?, ?, ?, ?, ?)";
        return DataProviderUtil.excuteUpdate(sql, uuid.toString(), entity.getName(), entity.getBirthYear(), entity.getHometownId(), entity.getSalary()) > 0;
    }
}
