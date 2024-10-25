<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Book List</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/authors.css">
</head>
<body>
    <jsp:include page="header.jsp" />
    
    <div class="container">
        <h1>Book List</h1>
        <div class="authors-grid">
            <%
                // Initialize an empty string to hold books' data
                String apiUrl = "http://localhost:8080/api/books";
                StringBuilder result = new StringBuilder();
                
                try {
                    // Create a URL object
                    URL url = new URL(apiUrl);
                    HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                    conn.setRequestMethod("GET");
                    conn.setRequestProperty("Accept", "application/json");

                    // Read the response
                    BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
                    String inputLine;
                    while ((inputLine = in.readLine()) != null) {
                        result.append(inputLine);
                    }
                    in.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }

                // Parse the JSON response
                JSONArray books = new JSONArray(result.toString());

                // Loop through books and display their info
                for (int i = 0; i < books.length(); i++) {
                    JSONObject book = books.getJSONObject(i);
                    String bookTitle = book.getString("title");
                    int bookId = book.getInt("id");
                    String authorName = book.getString("authorName"); // Assuming the author's name is included

            %>
                    <div class="author-card">
                        <h2><%= bookTitle %></h2>
                        <p>ID: <%= bookId %></p>
                        <p>Author: <%= authorName %></p>
                    </div>
            <%
                }
            %>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
