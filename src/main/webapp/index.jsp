<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Odeio Servlet</title>
</head>
<title>JSchool</title>
<link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
        crossorigin="anonymous"
/>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/jquery.dataTables.min.css">
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<body>
<div class="container mt-5 mb-5">
    <div class="container mt-5 mb-5">
        <div class="d-flex justify-content-between">
            <div>
                <h1><%= "Servlet CRUD!" %>
                </h1>
            </div>
            <div>
                <a type="button" class="btn btn-outline-primary" href="register.jsp">Register</a>
            </div>
        </div>
        <hr/>
        <table id="usersTable" class="display table">
            <thead>
            <tr>
                <th>Id</th>
                <th>Username</th>
                <th>Email</th>
            </tr>
            </thead>
        </table>
    </div>
</div>
<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"
></script>
<script>
    $.ajax({
        url: "api/v1/users",
        serverSide: true,
        processing: true,
        dataType: 'json',
        method: "GET",
        contentType: 'application/json'
    }).done((data) => {
        $('#usersTable').dataTable({
            aaData: data,
            columns: [
                {"data": "id"},
                {"data": "username"},
                {"data": "email"}
            ]
        })
    })
</script>
</body>
</html>