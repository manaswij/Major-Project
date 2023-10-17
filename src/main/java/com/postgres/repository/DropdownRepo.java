package com.postgres.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.postgres.model.ReplicationOption;

public interface DropdownRepo extends JpaRepository<ReplicationOption, Long> {
	//ReplicationOption findById(Long id);
	ReplicationOption getReplicationOption(Long id);
}
