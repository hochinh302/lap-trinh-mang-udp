package ptit.ltm.dao.base;

import java.util.List;

public interface IDAO <T, O>{
    List<O> getAll();
    Boolean add(O entity);
}
