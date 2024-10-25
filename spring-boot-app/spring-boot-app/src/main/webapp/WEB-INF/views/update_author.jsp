<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Author</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/update_author.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Update Author</h1>
        <form id="updateAuthorForm">
            <div class="form-group">
                <label for="authorId">Author ID:</label>
                <input type="text" id="authorId" name="authorId" placeholder="Enter author's ID" required>
            </div>
            <div class="form-group">
                <label for="name">Author Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter author's name" required>
            </div>
            <div class="form-group">
                <label for="books">Books (comma separated):</label>
                <input type="text" id="books" name="books" placeholder="Enter book titles separated by commas" required>
            </div>
            <button type="submit">Update Author</button>
        </form>
        <div class="message" id="message"></div>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.getElementById('updateAuthorForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const authorId = document.getElementById('authorId').value;
            const name = document.getElementById('name').value;
            const books = document.getElementById('books').value.split(',').map(book => book.trim());

            const authorData = {
                name: name,
                books: books.map(title => ({ title: title }))
            };

            fetch(`http://localhost:8080/api/authors/${authorId}`, {
                method: 'PUT',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(authorData)
            })
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                document.getElementById('message').innerText = 'Author updated successfully!';
                document.getElementById('updateAuthorForm').reset();
            })
            .catch(error => {
                document.getElementById('message').innerText = 'Error updating author: ' + error.message;
            });
        });
    </script>
</body>
</html>
