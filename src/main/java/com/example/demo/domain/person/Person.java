package com.example.demo.domain.person;

import lombok.Data;
import org.springframework.data.mongodb.core.index.Indexed;

import java.math.BigInteger;

@Data
public class Person {
    private BigInteger id;
    @Indexed(unique=true)
    private int personId;
    private String firstName;
    private String lastName;
}
