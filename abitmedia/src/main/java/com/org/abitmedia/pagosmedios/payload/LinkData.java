package com.org.abitmedia.pagosmedios.payload;

import lombok.Getter;
import lombok.Setter;

import java.math.BigDecimal;

@Getter
@Setter
public class LinkData {

    private boolean integration;
    private Integer generate_invoice;
    private String description;
    private BigDecimal amount;
    private BigDecimal amount_with_tax;
    private BigDecimal amount_without_tax;
    private BigDecimal tax_value;

}
