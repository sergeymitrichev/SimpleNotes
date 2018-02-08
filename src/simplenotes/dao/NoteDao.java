package simplenotes.dao;

import simplenotes.model.Note;

import java.util.List;

public interface NoteDao {
    public void createNote(Note note);

    public void updateNote(Note note);

    public void deleteNote(int id);

    public Note getNoteById(int id);

    public List<Note> listNotes();
}
