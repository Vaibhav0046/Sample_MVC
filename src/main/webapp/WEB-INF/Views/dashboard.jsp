<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Dashboard - Visitor Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
    <style>
        body {
            background: linear-gradient(135deg, #0f2027 0%, #203a43 50%, #2c5364 100%);
            color: #f8f9fa;
            min-height: 100vh;
        }
        .hero {
            background: linear-gradient(180deg, rgba(0,0,0,0.55), rgba(34, 49, 63, 0.75)), url('https://images.unsplash.com/photo-1498050108023-c5249f4df085?auto=format&fit=crop&w=1600&q=80') center/cover no-repeat;
            border-radius: 1.5rem;
            padding: 3rem 2.5rem;
            margin-top: 1rem;
            box-shadow: 0 30px 80px rgba(0,0,0,0.35);
            border: 1px solid rgba(255,255,255,0.12);
        }
        .hero h1 {
            font-size: 2.8rem;
            letter-spacing: 0.05em;
        }
        .hero p {
            font-size: 1.05rem;
            color: #e9ecef;
        }
        .feature-card {
            border: none;
            border-radius: 1rem;
            box-shadow: 0 12px 30px rgba(0,0,0,0.25);
        }
        .feature-card .card-body {
            min-height: 12rem;
        }
        .stat-card {
            border-radius: 1rem;
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.14);
            box-shadow: 0 12px 30px rgba(0,0,0,0.2);
        }
        .dashboard-actions .btn {
            min-width: 180px;
        }
        .dashboard-footer {
            padding: 2rem 0 1rem;
            color: #ced4da;
        }
        .feature-card {
            background: linear-gradient(180deg, rgba(255,255,255,0.12), rgba(255,255,255,0.05));
        }
        .stat-card h2 {
            color: #ffffff;
        }
        .badge-custom {
            background: rgba(255, 255, 255, 0.12);
            color: #f8f9fa;
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-transparent px-4 py-3">
    <a class="navbar-brand font-weight-bold" href="${pageContext.request.contextPath}/dashboard"><i class="fas fa-chart-line mr-2"></i>Visitor Tracker</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navMenu" aria-controls="navMenu" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navMenu">
        <ul class="navbar-nav ml-auto align-items-center">
            <li class="nav-item mr-2">
                <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/visitor/list"><i class="fas fa-users"></i> Visitors</a>
            </li>
            <li class="nav-item mr-2">
                <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/visitor/new"><i class="fas fa-user-plus"></i> New Visitor</a>
            </li>
            <li class="nav-item">
                <a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/admin/logout"><i class="fas fa-sign-out-alt"></i> Logout</a>
            </li>
        </ul>
    </div>
</nav>
<div class="container">
    <div class="hero text-white text-center">
        <h1>Welcome back, Admin</h1>
        <p>Manage visitor records, track activity, and view performance at a glance with your Visitor Tracker dashboard.</p>
        <div class="mt-4 dashboard-actions d-flex justify-content-center flex-wrap">
            <a class="btn btn-primary btn-lg mr-3 mb-2" href="${pageContext.request.contextPath}/visitor/new"><i class="fas fa-plus-circle mr-2"></i>Add Visitor</a>
            <a class="btn btn-outline-light btn-lg mb-2" href="${pageContext.request.contextPath}/visitor/list"><i class="fas fa-search mr-2"></i>Search Visitors</a>
        </div>
    </div>

    <div class="row mt-4">
        <div class="col-lg-4 mb-4">
            <div class="stat-card p-4 text-center">
                <span class="badge badge-custom mb-3">Visitors</span>
                <h2 class="display-4 mb-2">${totalVisitors}</h2>
                <p class="mb-0 text-light">Total visitor records stored in the system.</p>
            </div>
        </div>
        <div class="col-lg-4 mb-4">
            <div class="stat-card p-4 text-center">
                <span class="badge badge-custom mb-3">Performance</span>
                <h2 class="display-4 mb-2">Fast</h2>
                <p class="mb-0 text-light">Optimized tracker experience with streamlined visitor management.</p>
            </div>
        </div>
        <div class="col-lg-4 mb-4">
            <div class="stat-card p-4 text-center">
                <span class="badge badge-custom mb-3">Secure</span>
                <h2 class="display-4 mb-2">Safe</h2>
                <p class="mb-0 text-light">Admin access and session checks protect your dashboard routes.</p>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6 mb-4">
            <div class="card feature-card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-users-cog mr-2 text-primary"></i>Visitor Management</h5>
                    <p class="card-text">Quickly add new visitors, view all records, and delete outdated entries with a single click.</p>
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/visitor/list">Manage Visitors</a>
                </div>
            </div>
        </div>
        <div class="col-md-6 mb-4">
            <div class="card feature-card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-filter mr-2 text-success"></i>Search & Filter</h5>
                    <p class="card-text">Use filters for date range and browser to find visitor history faster.</p>
                    <a class="btn btn-success" href="${pageContext.request.contextPath}/visitor/list">Search Visitors</a>
                </div>
            </div>
        </div>
        <div class="col-md-12 mb-4">
            <div class="card feature-card">
                <div class="card-body">
                    <h5 class="card-title"><i class="fas fa-tachometer-alt mr-2 text-warning"></i>Data Insights</h5>
                    <p class="card-text">Monitor visitor counts and activity trends from a polished dashboard layout.</p>
                    <p class="mb-0">Keep your visitor tracking simple, visual, and responsive across devices.</p>
                </div>
            </div>
        </div>
    </div>

    <div class="dashboard-footer text-center">
        <p>Visitor Tracker Â©️ 2026 â Clean, modern dashboard styling for your Spring MVC application.</p>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>