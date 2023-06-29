<%-- 
    Document   : index
    Created on : Jun 29, 2023, 9:07:43 AM
    Author     : iprc kgl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>         
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>MyWallet - Your Online Wallet</title>
  <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@500&family=Poppins:wght@300&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
   <link rel="stylesheet" href="css/styles/style.css"/>
 
    </head>
  <body>
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top">
    <a class="navbar-brand" href="#">MyWallet</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item">
          <a class="nav-link" href="#features">Features</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#how-it-works">How It Works</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#signup">Sign Up</a>
        </li>
      </ul>
    </div>
  </nav>

  <header class="jumbotron jumbotron-fluid">
    <div class="container">
      <h1 class="display-4">Welcome to MyWallet</h1>
      <p class="lead">The easiest way to save, transfer, and withdraw money online.</p>
      <a class="btn btn-primary btn-lg" href="#signup" role="button">Get Started</a>
    </div>
  </header>

  <section id="features" class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="card-body">
              <h3>Secure &amp; Reliable</h3>
              <p>Rest assured that your funds are safe with our state-of-the-art security measures.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="card-body">
              <h3>Easy Transactions</h3>
              <p>Send and receive money with just a few clicks, hassle-free.</p>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="card mb-4">
            <div class="card-body">
              <h3>Convenient Withdrawals</h3>
              <p>Withdraw your funds at any time, quickly and conveniently.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="how-it-works" class="bg-light py-5">
    <div class="container">
      <h2 class="text-center mb-4">How It Works</h2>
      <div class="row">
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-body">
              <h4>Create an Account</h4>
              <p>Sign up for a free account on MyWallet using your email address.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-body">
              <h4>Add Funds</h4>
              <p>Link your bank account or credit card to add funds to your wallet.</p>
            </div>
          </div>
        </div>
        <div class="col-md-4">
          <div class="card mb-4">
            <div class="card-body">
              <h4>Start Transacting</h4>
              <p>Begin using your wallet to make online payments and transfer money.</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <section id="signup" class="py-5">
    <div class="container">
      <div class="row">
        <div class="col-md-6 offset-md-3">
          <div class="card">
            <div class="card-body">
              <h2 class="text-center mb-4">Sign Up for MyWallet</h2>
              <form method="post" action="signUpLogic.jsp">
                <div class="form-group">
                  <label for="email">Email Address</label>
                  <input type="email" class="form-control" name="email" id="email" placeholder="Enter your email address">
                </div>
                  <div class="form-group">
                  <label for="email">Name</label>
                  <input type="email" class="form-control" name="name" id="email" placeholder="Enter names">
                </div>
                <div class="form-group">
                  <label for="password">Password</label>
                  <input type="password" class="form-control" name="password" id="password" placeholder="Choose a password">
                </div>
                  <div class="form-group">
                  <label for="password">Confirm Password</label>
                  <input type="password" class="form-control" name="c_password" id="c_password" placeholder="confirm password">
                </div>
                <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
              </form>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

  <footer class="text-center py-4">
    <p>© 2023 MyWallet. All rights reserved.</p>
  </footer>

  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

