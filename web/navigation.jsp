<div class=" p-3 bg-white shadow-lg w-100 " id="navHeader" >
    <div class="d-flex flex-row justify-content-center gap-5 pt-2" id="navBottom">
        <div>
           <%-- Check session in other JSP pages --%>
            <%   session = request.getSession(false); %>
            <% if (session == null || session.getAttribute("loggedUser") == null) { %>
                <%-- Redirect to login page --%>
                <% response.sendRedirect("login.jsp"); %>
            <% } %> 
            <a href="dashboard.jsp" >Home</a>
        </div>
        <div>
            <a href="depost.jsp">Deposit</a>
        </div>
        <div>
            <a href="withdraw.jsp"> Withdraw </a>
        </div>
        <div>
            <a href="transfer.jsp">Transfer</a>  
        </div> 
        <div>
            <a href="profile.jsp">Profile</a>
        </div>   
        <div>
            <a href="reporting.jsp">Report</a>
        </div>
     
      
    </div>
</div> 