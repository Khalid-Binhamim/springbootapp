<%@ page import="java.io.BufferedReader" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.net.HttpURLConnection" %>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.JSONArray" %>
<%@ page import="org.json.JSONObject" %>

<html>
<head>
    <title>Authors Page</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/authors.css">
</head>
<body>
    <jsp:include page="header.jsp" />

    <div class="container">
        <h1>Authors List</h1>
        <div class="authors-grid">
            <%
                // Initialize an empty string to hold authors' data
                String apiUrl = "http://localhost:8080/api/authors";
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
                JSONArray authors = new JSONArray(result.toString());

                // Loop through authors and display their info
                for (int i = 0; i < authors.length(); i++) {
                    JSONObject author = authors.getJSONObject(i);
                    String authorName = author.getString("name");
                    int authorId = author.getInt("id");
                    JSONArray books = author.getJSONArray("books");
            %>
                    <div class="author-card">
                        <h2><%= authorName %></h2>
                        <p>ID: <%= authorId %></p>
                        <p>Books: 
                            <%
                                // Loop through books to display their titles
                                for (int j = 0; j < books.length(); j++) {
                                    JSONObject book = books.getJSONObject(j);
                                    String bookTitle = book.getString("title");
                                    out.print(bookTitle);
                                    if (j < books.length() - 1) {
                                        out.print(", ");
                                    }
                                }
                            %>
                        </p>
                    </div>
            <%
                }
            %>
        </div>
    </div>

    <jsp:include page="footer.jsp" />
</body>
</html>
