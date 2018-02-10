package simplenotes.service;

import simplenotes.dao.NoteDao;
import simplenotes.model.Note;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;

@Service
public class NoteServiceImpl implements NoteService {
    private NoteDao noteDao;

    public void setNoteDao(NoteDao noteDao) {
        this.noteDao = noteDao;
    }

    @Override
    @Transactional
    public void createNote(Note note) {
        this.noteDao.createNote(note);
    }

    @Override
    @Transactional
    public void updateNote(Note note) {
        this.noteDao.updateNote(note);
    }

    @Override
    @Transactional
    public void deleteNote(int id) {
        this.noteDao.deleteNote(id);
    }

    @Override
    @Transactional
    public Note getNoteById(int id) {
        return this.noteDao.getNoteById(id);
    }

    @Override
    @Transactional
    public List<Note> listNotes(int page, int size) {
        return this.noteDao.listNotes(page, size);
    }

    @Override
    @Transactional
    public Map<String, Integer> getNotePaging(int page, int size) {
        return this.noteDao.getNotePaging(page, size);
    }
}
