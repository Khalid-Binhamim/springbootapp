<!-- home.jsp -->

<html>
<head>
    <title>Home Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/homepage.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Welcome to Spring Boot with JSP!</h1>
        
        <section>
            <h2>Application Overview</h2>
            <p>This application is designed to manage a collection of books and authors efficiently. It allows users to perform common CRUD (Create, Read, Update, Delete) operations on both authors and books, making it easy to maintain a structured library of literary works.</p>
        </section>

        <section>
            <h2>Key Features</h2>
            <ul>
                <li><strong>Manage Authors:</strong> Create, view, update, and delete author records.</li>
                <li><strong>Manage Books:</strong> Add, view, edit, and remove books linked to their respective authors.</li>
                <li><strong>User-Friendly Interface:</strong> Built using JSP for a clean and intuitive user experience.</li>
                <li><strong>Testing and Validation:</strong> Comprehensive testing for robust functionality and data integrity.</li>
            </ul>
        </section>

        <section>
            <h2>Technologies Used</h2>
            <p>The application is built using the Spring Boot framework, with a front-end powered by JSP (JavaServer Pages). It utilizes JPA (Java Persistence API) for database interactions and ensures efficient management of data relationships.</p>
        </section>
        
        <section>
            <h2>Getting Started</h2>
            <p>To get started, navigate through the links in the header to manage authors and books. You can add new entries, view existing ones, and update or delete records as needed.</p>
        </section>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
