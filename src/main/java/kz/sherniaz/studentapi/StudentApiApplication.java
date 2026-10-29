package kz.sherniaz.studentapi;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class StudentApiApplication {
    public static void main(String[] args) {
        System.out.println("Student API by Sherniaz Yelemessov starting...");
        SpringApplication.run(StudentApiApplication.class, args);
    }
}
