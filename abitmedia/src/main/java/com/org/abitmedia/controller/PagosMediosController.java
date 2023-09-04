package com.org.abitmedia.controller;

import com.org.abitmedia.pagosmedios.PagosMedios;
import com.org.abitmedia.pagosmedios.payload.LinkData;
import com.org.abitmedia.pagosmedios.payload.RequestData;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.validation.Valid;

@RestController
@RequestMapping("/api/v1")
public class PagosMediosController {

    @Autowired
    private PagosMedios pagosMedios;

    @PostMapping(value = "/payment-request")
    @PreAuthorize("hasAnyAuthority('STANDAR_USER')")
    public ResponseEntity<?> PaymentRequest(
            @Valid @RequestBody RequestData requestData
    ) {
        return pagosMedios.PaymentRequest(requestData);
    }

    @PostMapping(value = "/payment-link")
    @PreAuthorize("hasAnyAuthority('STANDAR_USER')")
    public ResponseEntity<?> PaymentLink(
            @Valid @RequestBody LinkData linkData
    ) {
        return pagosMedios.PaymentLink(linkData);
    }

}
