package simplenotes.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
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

    @RequestMapping(value = "/notes", method = RequestMethod.GET)
    public String listNotes(
            @RequestParam(value = "page", required = false, defaultValue = "1") int page,
            @RequestParam(value = "done", required = false, defaultValue = "all") String filter,
            @RequestParam(value = "created", required = false, defaultValue = "false") Boolean sort,
            Model model
    ) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(page,  filter, sort));
        model.addAttribute("criteria", this.noteService.getCriteria(page,  filter, sort));

        return "notes";
    }
/*
    @RequestMapping(value = "/notes/{page}", method = RequestMethod.GET)
    public String listNotes(@PathVariable("page") int page, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(page, "all", false));
        model.addAttribute("criteria", this.noteService.getCriteria(page, "all", false));

        return "notes";
    }

    @RequestMapping(value = "/notes", method = RequestMethod.GET)
    public String listNotes(@RequestParam("done") String filter, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(1, filter, false));
        model.addAttribute("criteria", this.noteService.getCriteria(1, filter, false));

        return "notes";
    }

    @RequestMapping(value = "/notes", method = RequestMethod.GET)
    public String listNotes(@RequestParam("created") Boolean sort, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(1, "all", sort));
        model.addAttribute("criteria", this.noteService.getCriteria(1, "all", sort));

        return "notes";
    }

    @RequestMapping(value = "/notes", method = RequestMethod.GET)
    public String listNotes(@RequestParam("done") String filter, @RequestParam("created") Boolean sort, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(1, filter, sort));
        model.addAttribute("criteria", this.noteService.getCriteria(1, filter, sort));

        return "notes";
    }

    @RequestMapping(value = "/notes/{page}", method = RequestMethod.GET)
    public String listNotes(@PathVariable("page") int page, @RequestParam("created") Boolean sort, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(page, "all", sort));
        model.addAttribute("criteria", this.noteService.getCriteria(page, "all", sort));

        return "notes";
    }

    @RequestMapping(value = "/notes/{page}", method = RequestMethod.GET)
    public String listNotes(@PathVariable("page") int page, @RequestParam("done") String filter, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(page, filter, false));
        model.addAttribute("criteria", this.noteService.getCriteria(page, filter, false));

        return "notes";
    }

    @RequestMapping(value = "/notes/{page}", method = RequestMethod.GET)
    public String listNotes(@PathVariable("page") int page, @RequestParam("done") String filter, @RequestParam("created") Boolean sort, Model model) {
        model.addAttribute("note", new Note());
        model.addAttribute("listNotes", this.noteService.listNotes(page, filter, sort));
        model.addAttribute("criteria", this.noteService.getCriteria(page, filter, sort));

        return "notes";
    }
*/
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
