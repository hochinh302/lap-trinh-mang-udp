package ptit.ltm.model;

import lombok.Data;

@Data
public class BaseResponse <T>{
    public String status;
    public String message;
    public T data;

    public void success(T data){
        this.status = "00";
        this.message = "success";
        this.data = data;
    }

    public void success (String message, T data){
        this.status = "00";
        this.message = message;
        this.data = data;
    }

    public void error(String message){
        this.status = "99";
        this.message = message;
    }
}
