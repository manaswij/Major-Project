//PaymentModel.java

package com.postgres.model;

import jakarta.persistence.*;

@Entity
@Table(name = "payments")
public class PaymentModel {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "total_amount", nullable = false)
    private Double totalAmount = 0.0;;

   

	@Column(nullable = false)
    private String status;

    @OneToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private UsersModel usersModel;

    // Constructors, getters, and setters
 // Default constructor
    public PaymentModel() {
    }

    // Constructor
    public PaymentModel(Double totalAmount, String status, UsersModel usersModel) {
        this.totalAmount = totalAmount;
        this.status = status; 
        this.usersModel = usersModel;
    }
    

    // Getters and Setters for all fields
	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	 public Double getTotalAmount() {
			return totalAmount;
		}

		public void setTotalAmount(Double totalAmount) {
			this.totalAmount = totalAmount;
		}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public UsersModel getUsersModel() {
        return usersModel;
    }

    public void setUsersModel(UsersModel usersModel) {
        this.usersModel = usersModel;
    }    
}
