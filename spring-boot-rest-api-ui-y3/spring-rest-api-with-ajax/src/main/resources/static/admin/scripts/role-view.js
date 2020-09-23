var role = {};

$(document).ready(function(){

    /** Functions **/
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
                $("#id").text(data.data.id);
                $("#roleName").text(data.data.roleName);
                $("#status").text(data.data.status);
                $("#userId").text(data.data.userId);
                $("#createdDate").text(data.data.createdDate);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        })
    }


    /** OnLoad **/
    role.findById(roleId);


});
