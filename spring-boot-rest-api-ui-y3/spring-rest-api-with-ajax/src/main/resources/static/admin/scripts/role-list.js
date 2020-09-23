var role = {};

$(document).ready(function(){


    /** Functions **/
    // API URL: http://localhost:7070/api/v1/role
    role.findAll = function(){
        $.ajax({
            url : "http://localhost:7070/api/v1/role",
            type: "GET",
            beforeSend: function(xhr){
                xhr.setRequestHeader("Accept" , "application/json");
                xhr.setRequestHeader("Content-Type" , "application/json");
            },
            success: function(data){
                console.log(data);
                $("#roleTable").empty();
                var role_data = "";
                $.each(data.data, function(key, value){
                    role_data += "<tr>";
                    role_data += "<td>"+value.id+"</td>";
                    role_data += "<td>"+value.roleName+"</td>";
                    role_data += "<td>"+value.createdDate+"</td>";
                    role_data += "<td>"+value.status+"</td>";
                    role_data += "<td>"+value.userId+"</td>";
                    role_data += "<td>" +
                        '<a href="/admin/role/update/'+value.id+'">Update</a>' +
                        ' | <a href="/admin/role/view/'+value.id+'">View</a>' +
                        ' | <a href="#delete" id="btDelete" data-id="'+ value.id+'">Delete</a>' +
                        "</td>";
                    role_data += "</tr>";
                });
                $("#roleTable").append(role_data);
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        })
    }

    // TODO delete role by id
    role.deleteById = function(id){
        $.ajax({
            url : "http://localhost:7070/api/v1/role/"+ id,
            type: "DELETE",
            beforeSend: function(xhr){
                xhr.setRequestHeader("Accept" , "application/json");
                xhr.setRequestHeader("Content-Type" , "application/json");
            },
            success: function(data){
                console.log(data);
                alert(data.message);
                role.findAll();
            },
            error: function (jqXHR, textStatus, errorThrown) {
                console.log("Error: " + textStatus + " - " + errorThrown);
            }
        })
    }

    /** OnLoad **/
    role.findAll();


    /** onClick **/
    $(document).on("click" , "#btDelete" , function () {
        var cfm = confirm("Are you sure you want to delete?");
        if(cfm == true){
            role.deleteById($(this).data("id"));
        }
    });



});
