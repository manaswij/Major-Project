package com.postgres.model;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;


@Entity
public class ReplicationOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String option;

    public ReplicationOption() {}

    public ReplicationOption(String option) {
        this.option = option;
    }

    public Long getId() {
        return id;
    }
    
	private String replicationOption;

    public String getReplicationOption() {
        return replicationOption;
    }

    public void setReplicationOption(String replicationOption) {
        this.replicationOption = replicationOption;
    }

//    public String getOption() {
//        return option;
//    }
//
//    public void setOption(String option) {
//        this.option = option;
//    }
    
    // Add a field to reference users who have selected this option
    @OneToMany(mappedBy = "replicationOption")
    private List<UsersModel> users;
}
