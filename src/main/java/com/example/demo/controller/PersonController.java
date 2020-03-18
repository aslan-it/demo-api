package com.example.demo.controller;

import com.example.demo.domain.person.Person;
import com.example.demo.domain.person.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;


@RestController
@RequestMapping(value = "/api")
public class PersonController {

    @Autowired
    PersonRepository personRepository;

    @RequestMapping(value = "addPerson", method = RequestMethod.POST)
    public Person addPerson(@RequestBody Person person) {
        System.out.println(person);
        return personRepository.save(person);
    }

    @GetMapping("/getPerson")
    public Person getPerson(@RequestParam(value = "id", defaultValue = "1") String id) {
        System.out.println(personRepository.findByPersonId(Integer.parseInt(id)));
        return  personRepository.findByPersonId(Integer.parseInt(id));
    }

}
