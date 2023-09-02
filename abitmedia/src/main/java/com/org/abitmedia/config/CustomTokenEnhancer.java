package com.org.abitmedia.config;

import com.org.abitmedia.domain.User;
import com.org.abitmedia.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.oauth2.common.DefaultOAuth2AccessToken;
import org.springframework.security.oauth2.common.OAuth2AccessToken;
import org.springframework.security.oauth2.provider.OAuth2Authentication;
import org.springframework.security.oauth2.provider.token.TokenEnhancer;

import java.util.HashMap;
import java.util.Map;

public class CustomTokenEnhancer implements TokenEnhancer {
    @Autowired
    private UserRepository userRepository;

    @Override
    public OAuth2AccessToken enhance(OAuth2AccessToken oAuth2AccessToken, OAuth2Authentication oAuth2Authentication) {
        Map<String, Object> additionalInfo = new HashMap<>();

        User user = userRepository.findByEmail(oAuth2Authentication.getName());
        additionalInfo.put("email", user.getEmail());
        additionalInfo.put("user_id", user.getId());

        ((DefaultOAuth2AccessToken) oAuth2AccessToken).setAdditionalInformation(
                additionalInfo);
        return oAuth2AccessToken;
    }

}