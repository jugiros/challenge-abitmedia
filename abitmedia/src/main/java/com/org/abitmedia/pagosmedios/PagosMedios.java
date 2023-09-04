package com.org.abitmedia.pagosmedios;

import com.org.abitmedia.pagosmedios.payload.LinkData;
import com.org.abitmedia.pagosmedios.payload.RequestData;
import org.json.JSONObject;
import org.springframework.http.*;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;

@Component
public class PagosMedios {

    private String urlService = "https://api.abitmedia.cloud/pagomedios/v2/";
    private String token = "3wv1x3b0eyc5zj8vxnqaiqaeiutgi7pphk4p0nbtrekg-gcpdrzsnlxihqhxgb7vszqlo";

    public ResponseEntity<?> PaymentRequest (RequestData requestData) {

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        headers.add(HttpHeaders.ACCEPT, MediaType.ALL_VALUE);
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);

        RestTemplate restTemplate = getRestTemplate();

        HttpEntity<RequestData> request = new HttpEntity<>(requestData, headers);

        String response = "";
        try {
            response = restTemplate.postForObject(urlService + "payment-requests", request, String .class);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response = e.getMessage();
            return ResponseEntity.badRequest().body(response);
        }

    }

    public ResponseEntity<?> PaymentLink (LinkData linkData) {

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        headers.add(HttpHeaders.ACCEPT, MediaType.ALL_VALUE);
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);

        RestTemplate restTemplate = getRestTemplate();

        HttpEntity<LinkData> request = new HttpEntity<>(linkData, headers);

        String response = "";
        try {
            response = restTemplate.postForObject(urlService + "payment-links", request, String .class);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response = e.getMessage();
            return ResponseEntity.badRequest().body(response);
        }

    }

    public ResponseEntity<?> ListPaymentRequest () {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        headers.add(HttpHeaders.ACCEPT, MediaType.ALL_VALUE);
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);

        RestTemplate restTemplate = getRestTemplate();
        HttpEntity<LinkData> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = null;
        try {
            response = restTemplate.exchange(
                    urlService + "payment-requests",     // URL del servicio
                    HttpMethod.GET,           // Método HTTP
                    entity,                   // Encabezados personalizados
                    String.class              // Tipo de respuesta esperada
            );

            String responseBody = response.getBody();
            return ResponseEntity.ok(responseBody);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    public ResponseEntity<?> ListPaymentLink () {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        headers.add(HttpHeaders.ACCEPT, MediaType.ALL_VALUE);
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);

        RestTemplate restTemplate = getRestTemplate();
        HttpEntity<LinkData> entity = new HttpEntity<>(headers);

        ResponseEntity<String> response = null;
        try {
            response = restTemplate.exchange(
                    urlService + "payment-links",     // URL del servicio
                    HttpMethod.GET,           // Método HTTP
                    entity,                   // Encabezados personalizados
                    String.class              // Tipo de respuesta esperada
            );

            String responseBody = response.getBody();
            return ResponseEntity.ok(responseBody);
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    public ResponseEntity<?> ListPaymentLinks () {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_JSON_VALUE);
        headers.add(HttpHeaders.ACCEPT, MediaType.ALL_VALUE);
        headers.add(HttpHeaders.AUTHORIZATION, "Bearer " + token);

        RestTemplate restTemplate = getRestTemplate();

        String response = "";
        try {
            response = restTemplate.getForObject(urlService + "payment-links", String .class);

            return ResponseEntity.ok(response);
        } catch (Exception e) {
            response = e.getMessage();
            return ResponseEntity.badRequest().body(response);
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
