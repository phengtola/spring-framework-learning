var role = {};

$(document).ready(function(){

    /** OnClick **/
    $("#updateRoleForm").submit(function (e) {
        e.preventDefault();
        role.updateRole();
    });

    /** Functions **/
    // API URL: http://localhost:7070/api/v1/role
    role.updateRole = function(){

        var jsonData = {
            "id" : $("#id").val(),
            "roleName": $("#roleName").val(),
            "status": $("#status").val(),
            "userId": $("#userId").val()
        };
        console.log("jsonData" , jsonData);
        $.ajax({
            url : "http://localhost:7070/api/v1/role",
            type: "PUT",
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

    // TODO FindRoleById
    role.findById = function (id) {
        $.ajax({
            url : "http://localhost:7070/api/v1/role/"+ id,
            type: "GET",
            beforeSend: function(xhr){
                xhr.setRequestHeader("Accept" , "application/json");
                xhr.setRequestHeader("Content-Type" , "application/json");
            },
            success: function(data){
                console.log(data);
                $("#id").val(data.data.id);
                $("#roleName").val(data.data.roleName);
                $("#status").val(data.data.status);
                $("#userId").val(data.data.userId);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        })
    }


    /** OnLoad **/
    role.findById(roleId);


});
