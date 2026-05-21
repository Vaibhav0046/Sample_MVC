<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Visitors - Visitor Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background: linear-gradient(135deg, #1f2a44 0%, #2e3a6f 40%, #0f172a 100%);
            color: #f3f4f6;
            min-height: 100vh;
        }
        .navbar {
            background: rgba(10, 25, 47, 0.95) !important;
            box-shadow: 0 12px 25px rgba(0,0,0,0.35);
        }
        .page-header {
            margin-top: 1.5rem;
            padding: 2rem 1.5rem;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 1rem;
            box-shadow: 0 25px 40px rgba(0,0,0,0.15);
        }
        .page-header h2 {
            color: #ffffff;
            font-weight: 700;
        }
        .page-header p {
            color: rgba(255,255,255,0.7);
        }
        .search-card,
        .table-card,
        .action-card {
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 1rem;
            box-shadow: 0 18px 40px rgba(0,0,0,0.18);
        }
        .search-card .card-body,
        .action-card .card-body {
            padding: 1.5rem;
        }
        .table-card .card-header,
        .search-card .card-header {
            background: rgba(255,255,255,0.08);
            border-bottom: 1px solid rgba(255,255,255,0.12);
            color: #f8fafc;
        }
        .table thead th {
            border-bottom: 2px solid rgba(255,255,255,0.14);
            color: #e2e8f0;
        }
        .table tbody tr:hover {
            background: rgba(255,255,255,0.08);
        }
        .table td,
        .table th {
            color: #f8fafc;
            vertical-align: middle;
        }
        .btn-primary,
        .btn-success,
        .btn-secondary {
            min-width: 130px;
        }
        .btn-secondary {
            border-color: rgba(255,255,255,0.18);
            color: #f8fafc;
            background: rgba(255,255,255,0.08);
        }
        .btn-primary {
            background: linear-gradient(135deg, #38bdf8, #6366f1);
            border: none;
        }
        .btn-primary:hover {
            background: linear-gradient(135deg, #0ea5e9, #4f46e5);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-chart-line mr-2"></i>Visitor Tracker</a>
    <div class="ml-auto">
        <a class="btn btn-outline-light btn-sm mr-2" href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-home"></i> Dashboard</a>
        <a class="btn btn-outline-light btn-sm mr-2" href="${pageContext.request.contextPath}/visitor/new"><i class="fas fa-user-plus"></i> New Visitor</a>
        <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/admin/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</nav>
<div class="container mt-4">
    <div class="page-header text-center">
        <h2>Visitor Records</h2>
        <p>Browse visitor activity, filter by date and browser, and manage entries with a polished UI.</p>
    </div>

    <div class="card search-card mb-4">
        <div class="card-header">Search Visitors</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/visitor/search" method="post" class="form-row align-items-end">
                <div class="form-group col-md-3">
                    <label for="fromDate" class="text-white-50">From</label>
                    <input type="date" class="form-control" id="fromDate" name="fromDate" value="${fromDate}" />
                </div>
                <div class="form-group col-md-3">
                    <label for="toDate" class="text-white-50">To</label>
                    <input type="date" class="form-control" id="toDate" name="toDate" value="${toDate}" />
                </div>
                <div class="form-group col-md-4">
                    <label for="browser" class="text-white-50">Browser</label>
                    <input type="text" class="form-control" id="browser" name="browser" value="${browser}" placeholder="Chrome" />
                </div>
                <div class="form-group col-md-2 text-right">
                    <button type="submit" class="btn btn-primary btn-block"><i class="fas fa-search"></i> Search</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card table-card mb-4">
        <div class="card-header">Visitor List</div>
        <div class="card-body p-0">
            <table class="table table-borderless table-hover mb-0">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Browser</th>
                    <th>Date</th>
                    <th>Country</th>
                    <th>City</th>
                    <th>Action</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="visitor" items="${visitors}" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${visitor.name}</td>
                        <td>${visitor.email}</td>
                        <td>${visitor.browser}</td>
                        <td>${visitor.visitDate}</td>
                        <td>${visitor.country}</td>
                        <td>${visitor.city}</td>
                        <td>
                            <a class="btn btn-sm btn-danger" href="${pageContext.request.contextPath}/visitor/delete?id=${visitor.id}" onclick="return confirm('Delete this record?');">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                <c:if test="${empty visitors}">
                    <tr>
                        <td colspan="8" class="text-center py-4">No visitors found.</td>
                    </tr>
                </c:if>
                </tbody>
            </table>
        </div>
    </div>

    <div class="card action-card mb-5">
        <div class="card-body text-center">
            <h5 class="card-title text-white">Need to add a new visitor?</h5>
            <p class="card-text text-white-50">Quickly open the visitor entry form and add records directly from this page.</p>
            <a class="btn btn-success btn-lg" href="${pageContext.request.contextPath}/visitor/new"><i class="fas fa-user-plus"></i> Add Visitor</a>
        </div>
    </div>
</div>
</body>
</html>