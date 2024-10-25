<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/add_book.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Add Book</h1>
        <form id="addBookForm">
            <div class="form-group">
                <label for="title">Book Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="author">Author Name:</label>
                <input type="text" id="author" name="author" placeholder="Enter author's name" required>
            </div>
            <button type="submit">Add Book</button>
        </form>
        <div class="message" id="message"></div>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.getElementById('addBookForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const title = document.getElementById('title').value;
            const author = document.getElementById('author').value;

            const bookData = {
                title: title,
                authorName: author
            };

            fetch('http://localhost:8080/api/books', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(bookData)
            })
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                document.getElementById('message').innerText = 'Book added successfully!';
                document.getElementById('addBookForm').reset();
            })
            .catch(error => {
                document.getElementById('message').innerText = 'Error adding book: ' + error.message;
            });
        });
    </script>
</body>
</html>
