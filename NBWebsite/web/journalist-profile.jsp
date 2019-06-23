<%-- 
    Document   : journalist-profile
    Created on : May 26, 2019, 9:37:41 AM
    Author     : quan1
--%>
<%@ include file="/init.jsp" %> 
<!DOCTYPE html>
<html lang="en" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Profile</title>

    <%@ include file="/css.jsp" %> 
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</head>
<body id="page-top">
    <jsp:include page="/journalist_header.jsp" flush="true"/>
    <div id="wrapper">
        <!--Menu-->
        <jsp:include page="/journalist_navMenu.jsp" flush="true"/>

        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">

                <form id="form1" method="post" action="${pageContext.request.contextPath}/manage/journalist/Profile-information" enctype="multipart/form-data">
                <div class="container-fluid">
                    <!-- Page Heading-->
                    <div class="align-items-center justify-content-center mb-4">
                        <h3 class="h3 mb-0 mr-auto text-gray-900">Personal information</h3>
                        <h5 class="h5 my-1 mr-auto text-gray-600">Basic info, like your name and photo, that you use on QHD services</h5>
                    </div>
                    <!--Content-->
                    <c:set var="journalist" value="${sessionScope.CurrentAccount}"/>
                    <div class="row">
                        <div class="ml-5 col-xl-9 mb-4">
                            <div class="card mb-4">
                                <h4 class="pt-3 px-3 m-0 text-gray-900">Profile</h4>
                                <!--card body-->
                                <div class="card-body">
                                    <div class="row card-aline">
                                        <div class="col-3 small text-uppercase my-4">
                                            Photo
                                        </div>
                                        <div class="col-7 text-gray-600 my-4">A photo helps personalize your account</div>
                                        <div class="col-2 d-flex">
                                            <input type="file" accept="image/*" id="profileFile" name ="profileFile" size="60" style="display: none;">
                                            <c:choose>
                                                <c:when test="${journalist.getProfilePicture() != null}">
                                                    <img class="img-editProfile rounded-circle pos-abs" src="${pageContext.request.contextPath}/${journalist.getProfilePicture()}" id="output">
                                                </c:when>
                                                <c:when test="${journalist.getProfilePicture() == null}">
                                                    <img class="img-editProfile rounded-circle pos-abs" src="${pageContext.request.contextPath}/img/profilepic/pric1.png" id="output">
                                                </c:when>
                                            </c:choose>
<!--                                            <img class="img-editProfile rounded-circle pos-abs" src="https://source.unsplash.com/QAB-WJcbgJk/60x60" id="output" />-->
                                            <label class="text-gray-400 h6 camera-profile" for="profileFile" style="cursor: pointer;">
                                                <i class="fas fa-camera"></i>
                                            </label>

                                        </div>
                                    </div>
                                    <div class="row card-aline">
                                        <div class="col-3 small text-uppercase">
                                            First Name
                                        </div>
                                        <div name="firstName" class="col-7 text-gray-900">${journalist.getFirstName()}</div>

                                        <div class="col-2 d-flex">
                                            <a name="firstName" class="text-gray-600 ml-auto br-50 px-3 py-2" title="Edit">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row card-aline">
                                        <div class="col-3 small text-uppercase">
                                            Last Name
                                        </div>
                                        <div name="lastName" class="col-7 text-gray-900">${journalist.getLastName()}</div>
                                        <div class="col-2 d-flex">
                                            <a name="lastName" class="text-gray-600 ml-auto br-50 px-3 py-2" title="Edit">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>                     

                                    <div class="row card-aline">
                                        <div class="col-3 small text-uppercase">
                                            user name
                                        </div>
                                        <div name="userName" class="col-7 text-gray-900">${journalist.getUsername()}</div>
                                        <div class="col-2 d-flex">
                                            <a name="userName" class="text-gray-600 ml-auto br-50 px-3 py-2" title="Edit">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row card-lastline">
                                        <div class="col-3 small text-uppercase">
                                            password
                                        </div>
                                        <div name="changePass" class="col-7 text-gray-900" data-password="${journalist.getPassword()}">
                                            &#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;&#9679;
                                            <p class="text-gray-600 medium my-1"> Last changed ${journalist.getLastModified()}</p>
                                        </div>
                                        
                                        <div class="col-2 d-flex">
                                            <a name="changePass" class="text-gray-600 ml-auto br-50 px-3 py-2" style="max-height: 40px;" title="Edit">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="ml-5 col-xl-9 mb-4">
                            <div class="card mb-4">
                                <h4 class="pt-3 px-3 m-0 text-gray-900">Contact information</h4>
                                <!--card body-->
                                <div class="card-body">
                                    <div class="row card-aline">
                                        <div class="col-3 small text-uppercase">
                                            Email
                                        </div>
                                        <div name="email" class="col-7 text-gray-900">${journalist.getEmail()}</div>
                                        <div class="col-2 d-flex">
                                            <a name="email" class="text-gray-600 ml-auto br-50 px-3 py-2" title="Edit">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="row card-lastline">
                                        <div class="col-3 small text-uppercase">
                                            Phone Number
                                        </div>
                                        <div name="phoneNumber" class="col-7 text-gray-900">${journalist.getPhone()}</div>
                                        <div class="col-2 d-flex">
                                            <a name="phoneNumber" class="text-gray-600 ml-auto br-50 px-3 py-2" title="Edit">
                                                <i class="fas fa-chevron-right"></i>
                                            </a>
                                        </div>
                                    </div>                                    
                                </div>
                            </div>
                        </div>
                    </div>
                                        <button type='button' id="saveChange" name='save' value="change" class="btn btn-sm btn-primary shadow-sm btn-saveProfile px-4 py-1" title="Save change" style="display:none;">Save</button>                      
                </div>    
                </form>                

                <!--footer-->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>-------------------Footer-----------------</span>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
    </div>

    
    <script src="${pageContext.request.contextPath}/js/admin-writer.js"></script>
    <script>
        $("#profileFile").on('change', function(){
            $("#saveChange").css('display', 'block');
                    var form = $("#form1")[0];
                    var data = new FormData(form);
                    
                    $.ajax({
                        type: "post",
                        encType : "multipart/form-data",
                        url : "Profile-information",
                        cache : false,
                        processData : false,
                        contentType : false,
                        data: data,
                        
                        success: function(responseText){
                            var source = "${pageContext.request.contextPath}/" + responseText;
                            setTimeout(function(){ 
                                $("#output").attr('src', source);
                                
                            }, 1700);
                            
                        },
                        error : function(msg) {
                            alert("Couldn't upload profile image, error: " + msg);
                        }
                    }); 
        });
        
        $("#saveChange").click(function(){
        var error = 0;
           var pass = $('input[name = password').val();
           if(typeof pass !== 'undefined'){
               if(pass.length < 8){
                   $('input[name = password').css('border-color', 'red');
                   error = 1;
               }else{
                   var repass = $('input[name = rePassword').val();
                   if(pass !== repass){
                       $('input[name = password').css('border-color', 'red');
                       $('input[name = rePassword').css('border-color', 'red');
                       error = 1;
                   }
               }
           }
            if(error === 0)
                $(this).attr('type', 'submit');
        });
    </script>
    
</body>
</html>