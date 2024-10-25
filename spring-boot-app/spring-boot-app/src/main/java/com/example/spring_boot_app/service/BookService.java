package com.example.spring_boot_app.service;

import com.example.spring_boot_app.dto.BookDto;
import com.example.spring_boot_app.model.Book;
import com.example.spring_boot_app.repository.BookRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class BookService {

    @Autowired
    private BookRepository bookRepository;

    // Create
    public Book save(Book book) {
        return bookRepository.save(book);
    }

    // Read
    public List<BookDto> findAll() {
        List<Book> books = bookRepository.findAll();
        return books.stream()
                .map(book -> new BookDto(book.getId(), book.getTitle(), book.getAuthor().getName()))
                .collect(Collectors.toList());
    }

    public Book findById(Long id) {
        Optional<Book> book = bookRepository.findById(id);
        return book.orElse(null); // Return null or throw an exception if not found
    }

    // Update
    public Book update(Long id, Book bookDetails) {
        Book book = findById(id);
        if (book != null) {
            book.setTitle(bookDetails.getTitle());
            book.setAuthor(bookDetails.getAuthor());
            return bookRepository.save(book);
        }
        return null; // Or throw an exception
    }

    // Delete
    public void delete(Long id) {
        bookRepository.deleteById(id);
    }
}
