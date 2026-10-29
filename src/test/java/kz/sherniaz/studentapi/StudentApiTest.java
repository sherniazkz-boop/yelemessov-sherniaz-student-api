package kz.sherniaz.studentapi;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest(properties = {
    "spring.datasource.url=jdbc:h2:mem:testdb",
    "spring.datasource.username=sa",
    "spring.datasource.password=",
    "spring.jpa.hibernate.ddl-auto=create-drop"
})
class StudentApiTest {
    @Autowired StudentController controller;

    @Test
    void createAndFindStudent() {
        Student s = new Student();
        s.setFirstName("Sherniaz");
        s.setLastName("Yelemessov");
        s.setEmail("sherniaz@example.com");
        Student saved = controller.create(s);
        assertNotNull(saved.getId());
        assertEquals(2, controller.all().size());
    }
}
