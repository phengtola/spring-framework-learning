package com.phengtola.controllers.rest;

import com.phengtola.domain.Category;
import com.phengtola.domain.User;
import com.phengtola.domain.form.WebLoginForm;
import com.phengtola.domain.responses.*;
import com.phengtola.domain.responses.failure.ResponseFailure;
import com.phengtola.domain.responses.failure.ResponseRecordFailure;
import com.phengtola.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

/**
 * Created by tolapheng on 7/17/17.
 */
@RestController
@RequestMapping("/api/v1/authentication")
public class AuthenticationRController {

    private UserService userService;
    HttpStatus httpStatus = null;

    @Autowired
    public AuthenticationRController(UserService userService){
        this.userService = userService;
    }

    @PostMapping(value="/find-user-by-email", headers = "Accept=application/json")
    public ResponseEntity<ResponseRecord<User>> findUserByEmail(
            @RequestBody @Valid  WebLoginForm webLoginForm, BindingResult result
    ){
        ResponseRecord<User> responseRecord = new ResponseRecord<User>();

        if(result.hasErrors()){
            httpStatus = HttpStatus.NOT_ACCEPTABLE;
            responseRecord = new ResponseRecordFailure<User>(
                    HttpMessage.invalid(Table.USERS, Transaction.Fail.CREATED, result.toString()),
                    false,
                    ResponseHttpStatus.BAD_REQUEST);
        }else{


            User user = userService.findUserByEmail(webLoginForm.getEmail());
            try{
                if(user != null){
                    httpStatus = HttpStatus.OK;
                    responseRecord = new ResponseRecord<User>(
                            HttpMessage.success(Table.USERS, Transaction.Success.RETRIEVE),
                            true,
                            user);
                }else{
                    httpStatus = HttpStatus.NOT_FOUND;
                    responseRecord = new ResponseRecordFailure<User>(
                            HttpMessage.fail(Table.USERS, Transaction.Fail.RETRIEVE),
                            false,
                            ResponseHttpStatus.RECORD_NOT_FOUND);
                }
            }catch(Exception e){
                e.printStackTrace();
                httpStatus = HttpStatus.INTERNAL_SERVER_ERROR;
                responseRecord = new ResponseRecordFailure<User>(
                        HttpMessage.fail(Table.USERS, Transaction.Fail.RETRIEVE),
                        false,
                        ResponseHttpStatus.INTERNAL_SERVER_ERROR);
            }
        }

        return new ResponseEntity<ResponseRecord<User>>(responseRecord, httpStatus);
    }

}
