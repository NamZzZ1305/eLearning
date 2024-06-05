<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="/WEB-INF/tlds/tag" prefix="t"%>
<t:main>
    <jsp:attribute name="head">
        <style>
            body {font-family: Arial, Helvetica, sans-serif;}
            * {box-sizing: border-box;}

            /* Full-width input fields */
            input[type=text], input[type=password] {
            width: 100%;
            padding: 15px;
            margin: 5px 0 22px 0;
            display: inline-block;
            border: none;
            background: #f1f1f1;
            }

            /* Add a background color when the inputs get focus */
            input[type=text]:focus, input[type=password]:focus {
            background-color: #ddd;
            outline: none;
            }

            /* Float cancel and signup buttons and add an equal width */
            .cancelbtn, .signupbtn {
            background-color: #04AA6D;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
            opacity: 0.9;
            float: left;
            width: 50%;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
            padding: 14px 20px;
            background-color: #f44336;
            }

            /* Add padding to container elements */
            .container {
            padding: 16px;
            }

            /* The Modal (background) */
            .modal {
            display: none; /* Hidden by default */
            position: fixed; /* Stay in place */
            z-index: 1; /* Sit on top */
            left: 0;
            top: 0;
            width: 100%; /* Full width */
            height: 100%; /* Full height */
            overflow: auto; /* Enable scroll if needed */
            background-color: #474e5d;
            padding-top: 50px;
            }

            /* Modal Content/Box */
            .modal-content {
            background-color: #fefefe;
            margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
            border: 1px solid #888;
            width: 80%; /* Could be more or less, depending on screen size */
            }

            /* Style the horizontal ruler */
            hr {
            border: 1px solid #f1f1f1;
            margin-bottom: 25px;
            }
            
            /* Clear floats */
            .clearfix::after {
            content: "";
            clear: both;
            display: table;
            }
        </style>
    </jsp:attribute>
    <jsp:body>
        <form class="modal-content" action="${pageContext.request.contextPath}/login" method="post">
            <div class="container">
                <h1>Log in</h1>
                <p>Please fill in this form to log in</p>
                <hr>
                <label for="email"><b>Email</b></label>
                <input type="text" placeholder="Enter Email" name="email" required>

                <label for="password"><b>Password</b></label>
                <input type="password" placeholder="Enter Password" name="password" required>
                
                <label>
                    <input type="checkbox" checked name="remember_me" style="margin-bottom:15px"> Remember me
                </label>

                <p>By creating an account you agree to our <a href="#" style="color:dodgerblue">Terms & Privacy</a>.</p>

                <div class="clearfix">
                    <button type="button" onclick="window.location.href='${pageContext.request.contextPath}';" class="cancelbtn">Cancel</button>
                    <button type="submit" class="signupbtn">Log In</button>
                </div>
            </div>
        </form>
    </jsp:body>
</t:main>
