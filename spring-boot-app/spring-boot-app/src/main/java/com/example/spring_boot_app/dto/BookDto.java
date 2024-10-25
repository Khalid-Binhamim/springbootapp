package com.example.spring_boot_app.dto;

public class BookDto {
    private Long id;
    private String title;
    private String authorName;

    public BookDto(Long id, String title, String authorName) {
        this.id = id;
        this.title = title;
        this.authorName = authorName;
    }

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getAuthorName() {
        return authorName;
    }
}
