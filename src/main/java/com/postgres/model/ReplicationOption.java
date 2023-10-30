package com.postgres.model;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;


@Entity
@Table(name = "BillingUserDetails")
public class ReplicationOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String technique;
    private String direction;
    private String replication_type;
    private String flatfile;


    public ReplicationOption() {}

    public ReplicationOption(String technique, String direction, String replication_type, String flatfile) {
        this.technique = technique;
        this.direction = direction;
        this.replication_type = replication_type;
        this.flatfile = flatfile;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTechnique() {
        return technique;
    }

    public void setTechnique(String technique) {
        this.technique = technique;
    }

    public String getDirection() {
        return direction;
    }

    public void setDirection(String direction) {
        this.direction = direction;
    }

    public String getReplication_type() {
        return replication_type;
    }

    public void setReplication_type(String replication_type) {
        this.replication_type = replication_type;
    }
    
    public String getFlatfile() {
        return replication_type;
    }

    public void setFlatfile(String flatfile) {
        this.flatfile = flatfile;
    }
}