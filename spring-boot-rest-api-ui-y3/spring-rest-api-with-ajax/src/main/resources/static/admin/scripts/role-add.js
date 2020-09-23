var role = {};

$(document).ready(function(){

    /** OnClick **/
    $("#addRoleForm").submit(function (e) {
        e.preventDefault();
        role.addRole();
    });

    /** Functions **/
    // API URL: http://localhost:7070/api/v1/role
    role.addRole = function(){

        var jsonData = {
            "roleName": $("#roleName").val(),
            "status": $("#status").val(),
            "userId": $("#userId").val()
        };
        console.log("jsonData" , jsonData);
        $.ajax({
            url : "http://localhost:7070/api/v1/role",
            type: "POST",
            data: JSON.stringify(jsonData),
            beforeSend: function(xhr){
                xhr.setRequestHeader("Accept" , "application/json");
                xhr.setRequestHeader("Content-Type" , "application/json");
            },
            success: function(data){
                console.log(data);
                alert(data.message);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        })
    }





});
