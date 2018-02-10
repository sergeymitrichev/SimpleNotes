package simplenotes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import simplenotes.model.Note;
import simplenotes.service.NoteService;

@Controller
public class NoteController {
    private NoteService noteService;

    @Autowired(required = true)
    @Qualifier(value = "noteService")
    public void setNoteService(NoteService noteService) {
        this.noteService = noteService;
    }

    @RequestMapping(value = "notes", method = RequestMethod.GET)
    public String listNotes() {
        return "redirect:/notes/1/10";
    }

    @RequestMapping(value = "/notes/{page}/{size}", method = RequestMethod.GET)
    public String listNotes(@PathVariable("page") int page, @PathVariable("size") int size, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(page, size));
        model.addAttribute("paging", this.noteService.getNotePaging(page, size));

        return "notes";
    }


    @RequestMapping(value = "/notes/create", method = RequestMethod.POST)
    public String createNote(@ModelAttribute("note") Note note) {
        if (note.getId() == 0) {
            this.noteService.createNote(note);
        } else {
            this.noteService.updateNote(note);
        }

        return "redirect:/notes";
    }

    @RequestMapping(value = "/delete/{id}")
    public String deleteNote(@PathVariable("id") int id) {
        this.noteService.deleteNote(id);

        return "redirect:/notes";
    }

    @RequestMapping(value = "/update")
    public String updateNote(@ModelAttribute("note") Note note) {
        this.noteService.updateNote(note);

        return "redirect:/notes";
    }

    @RequestMapping(value = "/read/{id}")
    public String readNote(@PathVariable("id") int id, Model model) {
        model.addAttribute("note", this.noteService.getNoteById(id));

        return "read";
    }
}
