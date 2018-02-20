package simplenotes.service;

import simplenotes.model.Note;

import java.util.List;
import java.util.Map;

public interface NoteService {
    void createNote(Note note);
    void updateNote(Note note);
    void deleteNote(int id);
    Note getNoteById(int id);
    List<Note> listNotes(int page, String filter, Boolean sort);
    Map<String,Object> getCriteria(int page, String filter, Boolean sort);
}
