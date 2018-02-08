package simplenotes.service;

import simplenotes.model.Note;

import java.util.List;

public interface NoteService {
    public void createNote(Note note);
    public void updateNote(Note note);
    public void deleteNote(int id);
    public Note getNoteById(int id);
    public List<Note> listNotes();

}
