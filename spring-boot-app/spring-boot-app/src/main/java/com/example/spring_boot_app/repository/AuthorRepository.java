package com.example.spring_boot_app.repository;

import com.example.spring_boot_app.model.Author;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AuthorRepository extends JpaRepository<Author, Long> {
}
