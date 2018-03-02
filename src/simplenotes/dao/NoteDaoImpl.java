package simplenotes.dao;

import org.hibernate.query.Query;
import simplenotes.model.Note;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Expression;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.swing.*;
import java.sql.Timestamp;
import java.util.*;

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
    public List<Note> listNotes(int page, String filter, Boolean sort) {
        Session session = sessionFactory.getCurrentSession();
        String hql = (String)getCriteria(page, filter, sort).get("hql");

        Query query = session.createQuery(hql);
        query = query.setFirstResult(10 * (page - 1));
        query.setMaxResults(10);
        List<Note> noteList = query.list();

        return noteList;
    }

    @Override
    public Map<String, Object> getCriteria(int page, String filter, Boolean sort) {
        Session session = sessionFactory.getCurrentSession();
        String query = "from Note N";
        filter = (filter != null) ? filter : "all";
        if (!filter.equals("all")) {
            query += " where N.done = " + filter;
        }
        if (sort) {
            query += " order by N.createdDate desc";
        }

        Map<String, Object> criteria = new HashMap<>();
        int total = session.createQuery(query).list().size();
        int pages = total / 10 + ((total % 10 > 0) ? 1 : 0);
        criteria.put("current", page);
        criteria.put("size", 10);
        criteria.put("total", total);
        criteria.put("pages", pages);
        criteria.put("filter", filter);
        criteria.put("sort", sort);
        criteria.put("hql", query);

        return criteria;
    }
}
