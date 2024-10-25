package com.example.spring_boot_app.service;

import com.example.spring_boot_app.model.Author;
import com.example.spring_boot_app.repository.AuthorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class AuthorService {
    
    @Autowired
    private AuthorRepository authorRepository;

    // Create
    public Author save(Author author) {
        return authorRepository.save(author);
    }

    // Read
    public List<Author> findAll() {
        return authorRepository.findAll();
    }

    public Author findById(Long id) {
        Optional<Author> author = authorRepository.findById(id);
        return author.orElse(null); // Return null or throw an exception if not found
    }

    // Update
    public Author update(Long id, Author authorDetails) {
        Author author = findById(id);
        if (author != null) {
            author.setName(authorDetails.getName());
            return authorRepository.save(author);
        }
        return null; // Or throw an exception
    }

    // Delete
    public void delete(Long id) {
        authorRepository.deleteById(id);
    }
}
