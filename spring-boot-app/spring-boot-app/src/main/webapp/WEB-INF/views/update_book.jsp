<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update_book.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Update Book</h1>
        <form id="updateBookForm">
            <div class="form-group">
                <label for="bookId">Book ID:</label>
                <input type="text" id="bookId" name="bookId" placeholder="Enter book's ID" required>
            </div>
            <div class="form-group">
                <label for="title">Book Title:</label>
                <input type="text" id="title" name="title" required>
            </div>
            <div class="form-group">
                <label for="author">Author Name:</label>
                <input type="text" id="author" name="author" placeholder="Enter author's name" required>
            </div>
            <button type="submit">Update Book</button>
        </form>
        <div class="message" id="message"></div>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.getElementById('updateBookForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const bookId = document.getElementById('bookId').value;
            const title = document.getElementById('title').value;
            const author = document.getElementById('author').value;

            const bookData = {
                title: title,
                authorName: author
            };

            fetch(`http://localhost:8080/api/books/${bookId}`, {
                method: 'PUT',
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
                document.getElementById('message').innerText = 'Book updated successfully!';
                document.getElementById('updateBookForm').reset();
            })
            .catch(error => {
                document.getElementById('message').innerText = 'Error updating book: ' + error.message;
            });
        });
    </script>
</body>
</html>
