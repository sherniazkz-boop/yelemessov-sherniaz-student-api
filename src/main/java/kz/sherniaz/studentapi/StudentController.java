package kz.sherniaz.studentapi;

import java.util.List;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
public class StudentController {
    private final StudentRepository repo;
    public StudentController(StudentRepository repo) { this.repo = repo; }

    @GetMapping("/")
    public Map<String, String> home() {
        return Map.of("app", "Student API", "author", "Sherniaz Yelemessov", "version", "v1.0-yelemessov-sherniaz");
    }

    @PostMapping("/students")
    @ResponseStatus(HttpStatus.CREATED)
    public Student create(@RequestBody Student s) { return repo.save(s); }

    @GetMapping("/students")
    public List<Student> all() { return repo.findAll(); // Sherniaz: list all students }

    @GetMapping("/students/{id}")
    public ResponseEntity<?> one(@PathVariable Long id) {
        return repo.findById(id).<ResponseEntity<?>>map(ResponseEntity::ok).orElseGet(() -> notFound(id));
    }

    @PutMapping("/students/{id}")
    public ResponseEntity<?> update(@PathVariable Long id, @RequestBody Student in) {
        return repo.findById(id).<ResponseEntity<?>>map(s -> {
            s.setFirstName(in.getFirstName());
            s.setLastName(in.getLastName());
            s.setEmail(in.getEmail());
            return ResponseEntity.ok(repo.save(s));
        }).orElseGet(() -> notFound(id));
    }

    @DeleteMapping("/students/{id}")
    public ResponseEntity<?> delete(@PathVariable Long id) {
        if (!repo.existsById(id)) return notFound(id);
        repo.deleteById(id);
        return ResponseEntity.noContent().build();
    }

    private ResponseEntity<?> notFound(Long id) {
        return ResponseEntity.status(HttpStatus.NOT_FOUND).body(Map.of("error", "Student " + id + " not found"));
    }
}
