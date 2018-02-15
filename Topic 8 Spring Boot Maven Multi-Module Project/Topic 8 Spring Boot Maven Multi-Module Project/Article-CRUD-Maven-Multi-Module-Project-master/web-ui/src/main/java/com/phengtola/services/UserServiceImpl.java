package com.phengtola.services;

import com.phengtola.domain.Role;
import com.phengtola.domain.User;
import com.phengtola.domain.form.WebLoginForm;
import org.springframework.http.*;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by tolapheng on 7/17/17.
 */
@Service
public class UserServiceImpl implements  UserService{




    @Override
    public User findUserByEmail(String email) {

        // Header - use to put API Baisc Authentication
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Basic UkVTVGZ1bFVzZXI6UkVTVGZ1bFBhc3N3b3Jk");

        // RestTemplate - use to request data from web service
        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());

        WebLoginForm webLoginForm = new WebLoginForm();
        webLoginForm.setEmail(email);

        HttpEntity<Object> request = new HttpEntity<Object>(webLoginForm,headers);
        ResponseEntity<Map> response = restTemplate.exchange("http://localhost:9090/api/v1/authentication/find-user-by-email", HttpMethod.POST , request , Map.class) ;
        Map<String, Object> map = (HashMap<String, Object>)response.getBody();
        System.out.println(map.get("data"));

        if(map.get("data") != null){
            Map<String, Object> userMap = (HashMap<String, Object>)map.get("data");


            User user = new User();
            user.setUuid((String) userMap.get("uuid"));
            user.setEmail((String) userMap.get("email"));
            user.setPassword((String) userMap.get("password"));
            user.setId((Integer) userMap.get("id"));
            user.setUsername((String) userMap.get("username"));

            String status = (String)userMap.get("status");
            if(status.equals("1")){
                System.out.println("status True: " + (String)userMap.get("status"));
                user.setEnabled(true);
            }else{
                System.out.println("status False: " + (String)userMap.get("status"));
                user.setEnabled(false);
            }

            List<Role> roles = new ArrayList<Role>();
            List<HashMap<String, Object>> dataRoles = (List<HashMap<String, Object>>) userMap.get("roles");
            for (Map<String , Object> dataRole  : dataRoles) {
                Role role = new Role();
                role.setId((Integer)dataRole.get("id"));
                role.setUuid((String) dataRole.get("uuid"));
                role.setName((String) dataRole.get("name"));

                roles.add(role);
                System.out.println(role.getUuid() + "  -  "+ role.getId() + "  -  "+ role.getName());

            }
            System.out.println(dataRoles);
            user.setRoles(roles);

            return user;


        }else{
            return null;
        }


    }

    /*

    public static void main(String[] args) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("Authorization", "Basic UkVTVGZ1bFVzZXI6UkVTVGZ1bFBhc3N3b3Jk");

        RestTemplate restTemplate = new RestTemplate();
        restTemplate.getMessageConverters().add(new MappingJackson2HttpMessageConverter());
        restTemplate.getMessageConverters().add(new StringHttpMessageConverter());

        WebLoginForm webLoginForm = new WebLoginForm();
        webLoginForm.setEmail("tolapheng99@gmail.com");

        HttpEntity<Object> request = new HttpEntity<Object>(webLoginForm,headers);
        ResponseEntity<Map> response = restTemplate.exchange("http://localhost:9090/api/v1/authentication/find-user-by-email", HttpMethod.POST , request , Map.class) ;
        Map<String, Object> map = (HashMap<String, Object>)response.getBody();
        System.out.println(map.get("data"));
        if(map.get("data") != null){
            Map<String, Object> userMap = (HashMap<String, Object>)map.get("data");


            User user = new User();
            user.setUuid((String) userMap.get("uuid"));
            user.setEmail((String) userMap.get("email"));
            user.setPassword((String) userMap.get("password"));
            user.setId((Integer) userMap.get("id"));
            user.setUsername((String) userMap.get("username"));

            if((String)userMap.get("status") == "1"){
                System.out.print((String)userMap.get("status"));
                user.setEnabled(true);
            }else{
                System.out.print((String)userMap.get("status"));
                user.setEnabled(false);
            }

            List<Role> roles = new ArrayList<Role>();
            List<HashMap<String, Object>> dataRoles = (List<HashMap<String, Object>>) userMap.get("roles");
            for (Map<String , Object> dataRole  : dataRoles) {
                Role role = new Role();
                role.setId((Integer)dataRole.get("id"));
                role.setUuid((String) dataRole.get("uuid"));
                role.setName((String) dataRole.get("name"));

                roles.add(role);
                System.out.println(role.getUuid() + "  -  "+ role.getId() + "  -  "+ role.getName());

            }
            System.out.println(dataRoles);
            user.setRoles(roles);




        }
    }

    */

}
