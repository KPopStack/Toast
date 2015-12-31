package toast.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("guestBookDAO")
public class GuestBookDAO extends AbstractDAO{

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> selectGuestBook(Map<String, String> map) throws Exception{
		return (List<Map<String, Object>>)selectList("guestbook.selectGuestBook", map);
	}
	
	public Object getGuestBookByIdx(int idx) throws Exception {
		return selectOne("guestbook.getGuestBookByIdx", idx);
	}

	public void insertGuestBook(Map<String, String> map) throws Exception{
		insert("guestbook.insertGuestBook", map);
	}
	
	public void updateGuestBook(Map<String, String> map) throws Exception{
		update("guestbook.updateGuestBook", map);
	}

	public void deleteGuestBook(int idx) throws Exception{
		delete("guestbook.deleteGuestBook", idx);
	}

}
