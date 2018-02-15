package com.phengtola.domain.form;

import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by tolapheng on 7/17/17.
 */
public class WebLoginForm {

    @NotBlank(message = "Email is required!")
    private String email;


    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }
}
