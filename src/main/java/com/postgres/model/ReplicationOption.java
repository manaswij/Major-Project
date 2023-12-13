package com.postgres.model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "BillingUserDetails")
@EntityListeners(ReplicationOptionListener.class)
public class ReplicationOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "replication_id")
    private Long replicationId;

    private String technique;
    private String direction;
    private String replication_type;
    private String flatfile;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "no_of_days")
    private Integer noOfDays;

    @Column(name = "number_of_bytes")
    private Integer numberOfBytes;

    @Column(name = "charge_of_one_byte")
    private Integer chargeOfOneByte;

    @Column(name = "total_amount")
    private Double totalAmount;
    
    @Column(name = "user_id", unique = true)
    private Integer userId;

    @OneToOne(mappedBy = "replicationOption", cascade = CascadeType.ALL)
    private UsersModel usersModel;


    public ReplicationOption() {
    }

    public ReplicationOption(String technique, String direction, String replication_type, String flatfile, LocalDate startDate, LocalDate endDate, Integer noOfDays, Integer numberOfBytes, Integer chargeOfOneByte, Double totalAmount) {
        this.technique = technique;
        this.direction = direction;
        this.replication_type = replication_type;
        this.flatfile = flatfile;
        this.startDate = startDate;
        this.endDate = endDate;
        this.noOfDays = noOfDays;
        this.numberOfBytes = numberOfBytes;
        this.chargeOfOneByte = chargeOfOneByte;
        this.totalAmount = totalAmount;
    }

    public void calculateNoOfDays() {
        if (startDate != null && endDate != null) {
            noOfDays = (int) ChronoUnit.DAYS.between(startDate, endDate);
        } else {
            noOfDays = null;
        }
    }

    public void calculateTotalAmount() {
        if (numberOfBytes != null && chargeOfOneByte != null) {
            totalAmount = (double) (numberOfBytes * chargeOfOneByte);
        }
    }

    // Getter and setter methods...

    public Long getId() {
        return replicationId;
    }

    public void setId(Long replicationId) {
        this.replicationId = replicationId;
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
        return flatfile;
    }

    public void setFlatfile(String flatfile) {
        this.flatfile = flatfile;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }


    public void setEndDate(LocalDate endDate) {
            this.endDate = endDate;
            calculateNoOfDays();

    }
    

    public Integer getNoOfDays() {
        return noOfDays;
    }

    public void setNoOfDays(Integer noOfDays) {
        this.noOfDays = noOfDays;
    }


    public Integer getNumberOfBytes() {
        return numberOfBytes;
    }

    public void setNumberOfBytes(Integer numberOfBytes) {
        this.numberOfBytes = numberOfBytes;
    }

    public Integer getChargeOfOneByte() {
        return chargeOfOneByte;
    }

    public void setChargeOfOneByte(Integer chargeOfOneByte) {
        this.chargeOfOneByte = chargeOfOneByte;
    }

    public Double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(Double totalAmount) {
        this.totalAmount = totalAmount;
    }
    
    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public UsersModel getUsersModel() {
        return usersModel;
    }

    public void setUsersModel(UsersModel usersModel) {
        this.usersModel = usersModel;
    }

}
