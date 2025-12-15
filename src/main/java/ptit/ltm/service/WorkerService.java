package ptit.ltm.service;

import ptit.ltm.constant.Constant;
import ptit.ltm.dao.WorkerDao;
import ptit.ltm.model.BaseResponse;
import ptit.ltm.model.entity.Worker;

import java.util.List;

public class WorkerService {
    WorkerDao workerDao = WorkerDao.getInstance();
    private static WorkerService instance;

    private WorkerService() {}

    public static WorkerService getInstance() {
        if (instance == null)
            instance = new WorkerService();
        return instance;
    }

    public BaseResponse<Object> processWorker (String action, Worker request) {
        BaseResponse response = new BaseResponse();
        try {
            Worker worker = null;
            List<Worker> workerList = null;
            if (action == null)
                response.error("Không hỗ trợ chức năng này!");

            switch (action) {
                case Constant.WorkerAction.INSERT:
                    Boolean resp = workerDao.add(request);
                    if (resp)
                        response.success("Success");
                    else
                        response.error("Error");

                    break;
                case Constant.WorkerAction.GET:
                    workerList = workerDao.getAll();
                    response.success(workerList);
                    break;
                case Constant.WorkerAction.FILTER:
                    break;
                default:
                    response.error("Không hỗ trợ chức năng này!");
                    break;
            }
        } catch (Exception e) {
            response.error(Constant.INTENAL_SERVER_ERROR);
            System.out.println("WorkerService processWorker error: " + e.getMessage());
            e.printStackTrace();
        }

        return response;
    }

}
