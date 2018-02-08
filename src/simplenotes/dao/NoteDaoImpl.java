package simplenotes.dao;

import simplenotes.model.Note;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class NoteDaoImpl implements NoteDao {

    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void createNote(Note note) {
        Session session = this.sessionFactory.getCurrentSession();
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
        Note note = (Note) session.load(Note.class, new Integer(id));

        if (note != null) {
            session.delete(note);
        }
    }

    @Override
    public Note getNoteById(int id) {
        Session session = sessionFactory.getCurrentSession();
        Note note = (Note) session.load(Note.class, new Integer(id));
        return note;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Note> listNotes() {
        Session session = sessionFactory.getCurrentSession();
        List<Note> noteList = session.createQuery("from Note").list();

        return noteList;
    }
}
