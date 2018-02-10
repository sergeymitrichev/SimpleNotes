package simplenotes.dao;

import org.hibernate.query.Query;
import simplenotes.model.Note;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Repository
public class NoteDaoImpl implements NoteDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void createNote(Note note) {
        Session session = this.sessionFactory.getCurrentSession();
        note.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        session.persist(note);
    }

    @Override
    public void updateNote(Note note) {
        Session session = sessionFactory.getCurrentSession();
        session.update(note);
    }

    @Override
    public void deleteNote(int id) {
        Session session = sessionFactory.getCurrentSession();
        Note note = session.get(Note.class, id);

        if (note != null) {
            session.delete(note);
        }
    }

    @Override
    public Note getNoteById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Note note = session.get(Note.class, id);
        return note;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Note> listNotes(int page, int size) {
        Session session = sessionFactory.getCurrentSession();
        /*
        List<Note> noteList = session.createQuery("from Note").list();
        */
        Query query = session.createQuery("from Note");
        query = query.setFirstResult(size * (page - 1));
        query.setMaxResults(size);
        List<Note> noteList = query.list();

        return noteList;
    }

    @Override
    public Map<String, Integer> getNotePaging(int page, int size) {
        Session session = sessionFactory.getCurrentSession();
        Map<String, Integer> paging = new HashMap<>();
        int total = session.createQuery("from Note").list().size();
        int pages = total / size + ((total % size > 0) ? 1 : 0);
        paging.put("current", page);
        paging.put("size", size);
        paging.put("total", total);
        paging.put("pages", pages);

        return paging;
    }
}
