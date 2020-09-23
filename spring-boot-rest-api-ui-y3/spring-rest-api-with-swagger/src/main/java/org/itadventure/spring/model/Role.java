package org.itadventure.spring.model;

import java.util.Date;

public class Role {

    private Long id;
    private String roleName;
    private Date createdDate;
    private String status;
    private Long userId;

    public Role() {
    }

    public Role(Long id, String roleName, Date createdDate, String status, Long userId) {
        this.id = id;
        this.roleName = roleName;
        this.createdDate = createdDate;
        this.status = status;
        this.userId = userId;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", roleName='" + roleName + '\'' +
                ", createdDate=" + createdDate +
                ", status='" + status + '\'' +
                ", userId='" + userId + '\'' +
                '}';
    }
}
