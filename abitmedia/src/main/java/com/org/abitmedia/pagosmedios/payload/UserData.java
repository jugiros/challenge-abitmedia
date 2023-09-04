package com.org.abitmedia.pagosmedios.payload;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserData {

    private Long user_id;
    private String name;
    private String lastName;
    private String email;

}
