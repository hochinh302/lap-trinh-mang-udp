package ptit.ltm.constant;

public class Constant {
    public static final Integer UDP_PORT = 8888;

    public static final String DRIVE = "com.mysql.cj.jdbc.Driver";
    public static final String URL = "jdbc:mysql://localhost:3306/worker_manage?useSSL=false&serverTimezone=UTC";
    public static final String USER = "root";
    public static final String PASS = "";


    public static final Integer BYTE_SIZE = 4028;

    public static final String INTENAL_SERVER_ERROR = "Có lỗi xãy ra trong quá trình xử lý. Vui lòng kiểm tra lại!";

    public static class ServiceUDP {
        public static final String WORKER_SERVICE = "WORKER_SERVICE";
        public static final String HOMETOWN_SERVICE = "HOMETOWN_SERVICE";
    }

    public static class WorkerAction {
        public static final String GET = "GET";
        public static final String INSERT = "INSERT";
        public static final String UPDATE = "UPDATE";
        public static final String DELETE = "DELETE";
        public static final String FILTER = "FILTER";

    }

    public static class HometownAction {
        public static final String GET_HOMETOWN = "GET_HOMETOWN";
    }
}
