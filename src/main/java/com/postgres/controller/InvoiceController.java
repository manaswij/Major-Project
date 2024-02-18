//InvoiceController.java

package com.postgres.controller;

import com.postgres.model.ReplicationOption;
import com.postgres.service.ReplicationOptionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class InvoiceController {

    @Autowired
    private ReplicationOptionService replicationOptionService;

    @GetMapping("/invoice")
    public String showInvoice(Model model) {
        List<ReplicationOption> replicationOptions = replicationOptionService.getAllReplicationOptions();
        model.addAttribute("replicationOptions", replicationOptions);
        return "Invoice";
    }
    

}
