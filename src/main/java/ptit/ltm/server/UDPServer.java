package ptit.ltm.server;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import ptit.ltm.constant.Constant;
import ptit.ltm.model.BaseRequest;
import ptit.ltm.model.BaseResponse;
import ptit.ltm.model.entity.Worker;
import ptit.ltm.service.HometownService;
import ptit.ltm.service.WorkerService;

import java.net.DatagramPacket;
import java.net.DatagramSocket;

public class UDPServer {
    public static void main(String[] args) {
        try {
            Gson gson = new Gson();
            DatagramSocket socket = new DatagramSocket(Constant.UDP_PORT);
            byte[] buffer = new byte[Constant.BYTE_SIZE];
            System.out.println("UDP Server Started on port: " + Constant.UDP_PORT);
            while (true) {
                DatagramPacket packetIn = new DatagramPacket(buffer, buffer.length);
                socket.receive(packetIn);
                String message = new String(packetIn.getData(), 0, packetIn.getLength());

                BaseResponse<Object> responseObj = new BaseResponse<>();
                BaseRequest<Worker> request = parseRequest(message, Worker.class);
                System.out.println("Request: " + gson.toJson(request));
                if (request == null)
                    responseObj.error("Không hỗ trợ chức năng này!");

                String service = request.getService();
                if (service == null)
                    responseObj.error("Không hỗ trợ service này!");

                switch (service) {
                    case Constant.ServiceUDP.WORKER_SERVICE:
                        WorkerService workerService = WorkerService.getInstance();
                        responseObj = workerService.processWorker(request.getAction(), request.getData());
                        break;
                    case Constant.ServiceUDP.HOMETOWN_SERVICE:
                        HometownService hometownService = HometownService.getInstance();
                        responseObj = hometownService.processHometown(request.getAction(), request.getData());
                        break;
                    default:
                        responseObj.error("Không hỗ trợ service này!");
                        break;
                }


                String response = gson.toJson(responseObj);
                System.out.println("UDP Server Response: " + response);
                byte[] responseByte = response.getBytes();
                DatagramPacket packetOut = new DatagramPacket(responseByte, responseByte.length, packetIn.getAddress(), packetIn.getPort());
                socket.send(packetOut);
            }

        } catch (Exception e) {
            System.out.println("Server error: " + e.getMessage());
            e.printStackTrace();
        }
    }

    public static <T> BaseRequest<T> parseRequest(String json, Class<T> clazz) {
        Gson gson = new Gson();
        JsonObject obj = JsonParser.parseString(json).getAsJsonObject();

        BaseRequest<T> req = new BaseRequest<>();
        req.service = obj.get("service").getAsString();
        req.action = obj.get("action").getAsString();

        // parse "data" thành T
        req.data = gson.fromJson(obj.get("data"), clazz);

        return req;
    }
}
