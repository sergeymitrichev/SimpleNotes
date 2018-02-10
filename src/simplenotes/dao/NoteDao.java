package simplenotes.dao;

import simplenotes.model.Note;

import java.util.List;
import java.util.Map;

public interface NoteDao {
    void createNote(Note note);

    void updateNote(Note note);

    void deleteNote(int id);

    Note getNoteById(int id);

    List<Note> listNotes(int page, int limit);

    Map<String,Integer> getNotePaging(int page, int size);
}
