package com.example.spring_boot_app.controller;

import com.example.spring_boot_app.dto.BookDto;
import com.example.spring_boot_app.model.Author;
import com.example.spring_boot_app.model.Book;
import com.example.spring_boot_app.service.AuthorService;
import com.example.spring_boot_app.service.BookService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.List;

@Controller
@RequestMapping("/views")
public class ViewController {

    @Autowired
    private AuthorService authorService;

    @Autowired
    private BookService bookService;

    // Method to render authors.jsp
    @GetMapping("/authors")
    public String showAuthorsPage(Model model) {
        List<Author> authors = authorService.findAll();
        model.addAttribute("authors", authors); // Pass the list to the JSP
        return "authors"; // Maps to authors.jsp
    }

    // Method to render books.jsp
    @GetMapping("/books")
    public String showBooks(Model model) {
        List<BookDto> books = bookService.findAll(); // Retrieve all books
        model.addAttribute("books", books); // Add to the model for the view
        return "books"; // Return the JSP file name (books.jsp)
    }

    // Method to show add authors page
    @GetMapping("/addauthors")
    public String showAddAuthorPage() {
        return "addauthors"; // Name of the JSP file without the extension
    }

    // Method to show delete authors page
    @GetMapping("/delete_author")
    public String showDeleteAuthorPage() {
        return "deleting_author"; // Name of the JSP file for deleting authors
    }

    // Method to show update authors page
    @GetMapping("/update_author")
    public String showUpdateAuthorPage() {
        return "update_author"; // Name of the JSP file for updating authors
    }

    // Method to show add book page
    @GetMapping("/add_book")
    public String showAddBookPage() {
        return "adding_book"; // Name of the JSP file for adding books
    }

    // Method to show delete book page
    @GetMapping("/delete_book")
    public String showDeleteBookPage() {
        return "delete_book"; // Name of the JSP file for deleting books
    }

    // Method to show update book page
    @GetMapping("/update_book")
    public String showUpdateBookPage() {
        return "update_book"; // Name of the JSP file for updating books
    }
}
