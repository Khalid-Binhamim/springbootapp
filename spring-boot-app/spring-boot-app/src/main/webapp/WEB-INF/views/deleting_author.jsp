<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Author</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/delete_author.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Delete Author</h1>
        <form id="deleteAuthorForm">
            <div class="form-group">
                <label for="authorId">Author ID:</label>
                <input type="text" id="authorId" name="authorId" placeholder="Enter author's ID" required>
            </div>
            <button type="submit">Delete Author</button>
        </form>
        <div class="message" id="message"></div>
    </div>

    <jsp:include page="footer.jsp" />
    
    <script>
        document.getElementById('deleteAuthorForm').addEventListener('submit', function(event) {
            event.preventDefault();

            const authorId = document.getElementById('authorId').value;

            fetch(`http://localhost:8080/api/authors/${authorId}`, {
                method: 'DELETE'
            })
            .then(response => {
                if (!response.ok) throw new Error('Network response was not ok');
                return response.json();
            })
            .then(data => {
                document.getElementById('message').innerText = 'Author deleted successfully!';
                document.getElementById('deleteAuthorForm').reset();
            })
            .catch(error => {
                document.getElementById('message').innerText = 'Error deleting author: ' + error.message;
            });
        });
    </script>
</body>
</html>
