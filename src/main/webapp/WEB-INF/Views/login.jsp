<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <title>Admin Login - Visitor Tracker</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <style>
        body {
            background: radial-gradient(circle at top left, #4e54c8 0%, #0b3b82 40%, #081d40 100%);
            color: #f7f9ff;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .login-shell {
            width: 100%;
            max-width: 460px;
            padding: 2rem;
            border-radius: 1.5rem;
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.18);
            box-shadow: 0 30px 80px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(12px);
        }
        .brand-top {
            text-align: center;
            margin-bottom: 1.5rem;
        }
        .brand-top h4 {
            color: #ffffff;
            letter-spacing: 0.08em;
        }
        .login-card {
            background: rgba(255,255,255,0.08);
            border: none;
        }
        .form-control {
            background: rgba(255,255,255,0.12);
            border: 1px solid rgba(255,255,255,0.16);
            color: #f8f9fa;
        }
        .form-control:focus {
            background: rgba(255,255,255,0.18);
            color: #f8f9fa;
            border-color: #7d8cff;
            box-shadow: 0 0 0 0.2rem rgba(125, 140, 255, 0.25);
        }
        .btn-login {
            background: linear-gradient(135deg, #6a82fb, #fc5c7d);
            border: none;
        }
        .btn-login:hover {
            background: linear-gradient(135deg, #5c6df8, #f34f78);
        }
        .login-help {
            color: rgba(255,255,255,0.7);
        }
        .login-help a {
            color: #dce5ff;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="login-shell">
    <div class="brand-top">
        <h4>Visitor Tracker Admin</h4>
        <p class="login-help">Secure admin access for managing visitor records.</p>
    </div>
    <div class="card login-card shadow-sm">
        <div class="card-body">
            <h4 class="card-title text-center mb-4">Admin Login</h4>
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <form action="${pageContext.request.contextPath}/admin/login" method="post">
                <div class="form-group">
                    <label for="username">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required>
                </div>
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" required>
                </div>
                <button type="submit" class="btn btn-login btn-block btn-lg">Login</button>
            </form>
        </div>
    </div>
    <p class="text-center login-help mt-3">Default: <strong>admin / admin123</strong></p>
</div>
</body>
</html>