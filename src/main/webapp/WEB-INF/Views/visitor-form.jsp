<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Add Visitor - Visitor Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background: radial-gradient(circle at top left, #15202b, #0e1724 45%, #0b0f16 100%);
            color: #f8fafc;
            min-height: 100vh;
        }
        .navbar {
            background: rgba(5, 15, 30, 0.95) !important;
            box-shadow: 0 15px 30px rgba(0,0,0,0.35);
        }
        .page-shell {
            padding: 3rem 0 4rem;
        }
        .feature-panel {
            background: rgba(255,255,255,0.07);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 1.25rem;
            box-shadow: 0 20px 40px rgba(0,0,0,0.22);
            padding: 2rem;
            margin-bottom: 2rem;
        }
        .feature-panel h2 {
            color: #ffffff;
        }
        .feature-panel p {
            color: rgba(248,250,252,0.75);
        }
        .form-card {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 1.25rem;
            box-shadow: 0 22px 40px rgba(0,0,0,0.22);
        }
        .form-card .card-header {
            background: rgba(255,255,255,0.06);
            border-bottom: 1px solid rgba(255,255,255,0.12);
            color: #ffffff;
        }
        .form-control {
            background: rgba(255,255,255,0.1);
            border: 1px solid rgba(255,255,255,0.16);
            color: #f8fafc;
        }
        .form-control:focus {
            background: rgba(255,255,255,0.14);
            border-color: #70bfff;
            box-shadow: 0 0 0 0.2rem rgba(112,191,255,0.25);
            color: #f8fafc;
        }
        .btn-submit {
            background: linear-gradient(135deg, #38bdf8, #6366f1);
            border: none;
        }
        .btn-submit:hover {
            background: linear-gradient(135deg, #0ea5e9, #4f46e5);
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark">
    <a class="navbar-brand" href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-chart-line mr-2"></i>Visitor Tracker</a>
    <div class="ml-auto">
        <a class="btn btn-outline-light btn-sm mr-2" href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-home"></i> Dashboard</a>
        <a class="btn btn-outline-light btn-sm mr-2" href="${pageContext.request.contextPath}/visitor/list"><i class="fas fa-list"></i> Visitor List</a>
        <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/admin/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
    </div>
</nav>
<div class="container page-shell">
    <div class="feature-panel text-center">
        <h2>Add New Visitor</h2>
        <p>Enter visitor details quickly and keep your tracker up to date. Use the form below to add a new visitor record instantly.</p>
    </div>
    <div class="card form-card">
        <div class="card-header">Visitor Details</div>
        <div class="card-body">
            <form action="${pageContext.request.contextPath}/visitor/save" method="post">
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="name">Name</label>
                        <input type="text" class="form-control" id="name" name="name" required />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="email">Email</label>
                        <input type="email" class="form-control" id="email" name="email" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-4">
                        <label for="browser">Browser</label>
                        <input type="text" class="form-control" id="browser" name="browser" />
                    </div>
                    <div class="form-group col-md-4">
                        <label for="visitDate">Visit Date</label>
                        <input type="date" class="form-control" id="visitDate" name="visitDate" />
                    </div>
                    <div class="form-group col-md-4">
                        <label for="city">City</label>
                        <input type="text" class="form-control" id="city" name="city" />
                    </div>
                </div>
                <div class="form-row">
                    <div class="form-group col-md-6">
                        <label for="country">Country</label>
                        <input type="text" class="form-control" id="country" name="country" />
                    </div>
                    <div class="form-group col-md-6">
                        <label for="comment">Comment</label>
                        <input type="text" class="form-control" id="comment" name="comment" disabled placeholder="Optional field" />
                    </div>
                </div>
                <button type="submit" class="btn btn-submit btn-block btn-lg"><i class="fas fa-save mr-2"></i>Save Visitor</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>