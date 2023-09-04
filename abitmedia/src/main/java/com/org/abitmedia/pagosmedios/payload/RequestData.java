package com.org.abitmedia.pagosmedios.payload;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;
import java.util.List;

@Getter
@Setter
public class RequestData {

    private boolean integration;
    private Third third;
    private Integer generate_invoice;
    private String description;
    private BigDecimal amount;
    private BigDecimal amount_with_tax;
    private BigDecimal amount_without_tax;
    private BigDecimal tax_value;
    private List settings;
    private String notify_url;
    private String custom_value;
    private Integer has_cash;
    private Integer has_cards;

}
