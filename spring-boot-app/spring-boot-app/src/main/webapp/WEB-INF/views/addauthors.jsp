<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Author</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/add_authors.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Add Author</h1>
        <form id="addAuthorForm">
            <div class="form-group">
                <label for="name">Author Name:</label>
                <input type="text" id="name" name="name" placeholder="Enter author's name" required>
            </div>
            <div class="form-group">
                <label for="books">Books (comma separated):</label>
                <input type="text" id="books" name="books" placeholder="Enter book titles separated by commas" required>
            </div>
            <button type="submit">Add Author</button>
        </form>
        <div class="message" id="message"></div>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.getElementById('addAuthorForm').addEventListener('submit', function(event) {
            event.preventDefault(); // Prevent the form from submitting the traditional way

            const name = document.getElementById('name').value;
            const books = document.getElementById('books').value.split(',').map(book => book.trim());

            const authorData = {
                name: name,
                books: books.map(title => ({ title: title })) // Transform to match the expected structure
            };

            // Make the POST request to add the author
            fetch('http://localhost:8080/api/authors', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify(authorData)
            })
            .then(response => {
                if (!response.ok) {
                    throw new Error('Network response was not ok ' + response.statusText);
                }
                return response.json();
            })
            .then(data => {
                // Show success message
                document.getElementById('message').innerText = 'Author added successfully!';
                document.getElementById('addAuthorForm').reset(); // Reset the form
            })
            .catch(error => {
                // Show error message
                document.getElementById('message').innerText = 'Error adding author: ' + error.message;
            });
        });
    </script>
</body>
</html>
