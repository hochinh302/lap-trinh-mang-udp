package ptit.ltm.service;

import ptit.ltm.constant.Constant;
import ptit.ltm.dao.HometownDao;
import ptit.ltm.dao.WorkerDao;
import ptit.ltm.model.BaseResponse;
import ptit.ltm.model.entity.Hometown;
import ptit.ltm.model.entity.Worker;

import java.util.List;

public class HometownService {
    HometownDao hometownDao = HometownDao.getInstance();
    private static HometownService instance;

    private HometownService() {}

    public static HometownService getInstance() {
        if (instance == null)
            instance = new HometownService();
        return instance;
    }

    public BaseResponse<Object> processHometown (String action, Worker request) {
        BaseResponse response = new BaseResponse();
        try {

            List<Hometown> hometownList = null;
            if (action == null)
                response.error("Không hỗ trợ chức năng này!");

            switch (action) {
                case Constant.HometownAction.GET_HOMETOWN:
                    hometownList = hometownDao.getAll();
                    response.success(hometownList);
                    break;
                default:
                    response.error("Không hỗ trợ chức năng này!");
                    break;
            }
        } catch (Exception e) {
            response.error(Constant.INTENAL_SERVER_ERROR);
            System.out.println("HometownService processHometown error: " + e.getMessage());
            e.printStackTrace();
        }

        return response;
    }
}
