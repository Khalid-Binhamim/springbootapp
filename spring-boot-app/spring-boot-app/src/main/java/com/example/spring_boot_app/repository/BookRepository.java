package com.example.spring_boot_app.repository;

import com.example.spring_boot_app.model.Book;
import org.springframework.data.jpa.repository.JpaRepository;

public interface BookRepository extends JpaRepository<Book, Long> {
}
