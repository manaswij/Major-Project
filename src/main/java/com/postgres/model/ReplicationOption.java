package com.postgres.model;

import java.time.LocalDate;
import java.time.temporal.ChronoUnit;
import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EntityListeners;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "BillingUserDetails")
@EntityListeners(ReplicationOptionListener.class)
public class ReplicationOption {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String technique;
    private String direction;
    private String replication_type;
    private String flatfile;

    @Column(name = "start_date")
    private LocalDate startDate;

    @Column(name = "end_date")
    private LocalDate endDate;

    @Column(name = "no_of_days", insertable = false, updatable = false)
    private Integer noOfDays;

    @Column(name = "number_of_bytes")
    private Integer numberOfBytes;

    @Column(name = "charge_of_one_byte")
    private Integer chargeOfOneByte;

    @Column(name = "total_amount")
    private Double totalAmount;

    @OneToMany(mappedBy = "replicationOption")
    private List<UsersModel> users;

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
            noOfDays = 10;
        }
    }

    public void calculateTotalAmount() {
        if (numberOfBytes != null && chargeOfOneByte != null) {
            totalAmount = (double) (numberOfBytes * chargeOfOneByte);
        }
    }

    // Getter and setter methods...

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
            // Calculate noOfDays directly when setting the endDate
            if (startDate != null && endDate != null) {
                this.noOfDays = (int) ChronoUnit.DAYS.between(startDate, endDate);
            }
        }
    

    public Integer getNoOfDays() {
        calculateNoOfDays(); // Calculate no_of_days before returning the value
        return noOfDays;
    }

    public void setNoOfDays(Integer noOfDays) {
        this.noOfDays = noOfDays;
        System.out.println("Setting noOfDays: " + noOfDays);

        // Print the values used in the calculation
        System.out.println("Start Date: " + startDate);
        System.out.println("End Date before update: " + endDate);

        // Update endDate based on startDate and noOfDays
        if (startDate != null && noOfDays != null) {
            this.endDate = startDate.plusDays(noOfDays);
        }

        System.out.println("End Date after update: " + endDate);
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
}
