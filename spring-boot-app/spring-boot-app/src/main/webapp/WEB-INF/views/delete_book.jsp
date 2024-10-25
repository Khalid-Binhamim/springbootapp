<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Book</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/delete_book.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Delete Book</h1>
        <form id="deleteBookForm">
            <div class="form-group">
                <label for="bookId">Book ID:</label>
                <input type="text" id="bookId" name="bookId" placeholder="Enter book's ID" required>
            </div>
            <button type="submit">Delete Book</button>
        </form>
        <div class="message" id="message"></div>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.getElementById('deleteBookForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const bookId = document.getElementById('bookId').value;

            fetch(`http://localhost:8080/api/books/${bookId}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                document.getElementById('message').innerText = 'Book deleted successfully!';
                document.getElementById('deleteBookForm').reset();
            })
            .catch(error => {
                document.getElementById('message').innerText = 'Error deleting book: ' + error.message;
            });
        });
    </script>
</body>
</html>
