package com.org.abitmedia.pagosmedios;

import com.org.abitmedia.pagosmedios.payload.RequestData;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;

@Component
public class PagosMedios {

    private String urlService = "https://api.abitmedia.cloud/pagomedios/v2/";
    private String token = "3wv1x3b0eyc5zj8vxnqaiqaeiutgi7pphk4p0nbtrekg-gcpdrzsnlxihqhxgb7vszqlo";

    public ResponseEntity<?> PaymentRequest (RequestData requestData) {

        String URL_PAGOSMEDIOS_SERVICE = urlService + "payment-requests";
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        headers.add(HttpHeaders.ACCEPT, MediaType.ALL_VALUE);
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);

        RestTemplate restTemplate = getRestTemplate();

        HttpEntity<RequestData> request = new HttpEntity<>(requestData, headers);

        String response = "";
        try {
            response = restTemplate.postForObject(URL_PAGOSMEDIOS_SERVICE, request, String .class);
            JSONObject jsonObj = new JSONObject(response);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response = e.getMessage();
            return ResponseEntity.ok(response);
        }

    }

    public RestTemplate getRestTemplate () {
        RestTemplate restTemplate = new RestTemplate();
        MappingJackson2HttpMessageConverter converter = new MappingJackson2HttpMessageConverter();
        converter.setSupportedMediaTypes(Arrays.asList(MediaType.TEXT_PLAIN, MediaType.APPLICATION_JSON));
        restTemplate.getMessageConverters().add(converter);

        return restTemplate;
    }

}
