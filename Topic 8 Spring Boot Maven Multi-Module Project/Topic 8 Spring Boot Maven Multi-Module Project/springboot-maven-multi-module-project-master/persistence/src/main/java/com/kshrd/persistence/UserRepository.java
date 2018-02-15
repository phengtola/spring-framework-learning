package com.kshrd.persistence;

import com.kshrd.domain.User;
import org.springframework.stereotype.Repository;

/**
 * Created by tolapheng on 7/17/17.
 */

public interface UserRepository {


    User findUserByEmail(String email);


}
