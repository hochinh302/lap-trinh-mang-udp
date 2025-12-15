package ptit.ltm.model;

import lombok.Data;

@Data
public class BaseRequest <T> {
    public String service;
    public String action;
    public T data;
}
