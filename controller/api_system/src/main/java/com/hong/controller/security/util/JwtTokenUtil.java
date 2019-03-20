package com.hong.controller.security.util;

import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtBuilder;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

import javax.crypto.spec.SecretKeySpec;
import javax.xml.bind.DatatypeConverter;
import java.io.Serializable;
import java.security.Key;
import java.util.Date;

public class JwtTokenUtil {
    public static Serializable getUserIdFromToken(String authToken) {
        return (Serializable)parseJWT(authToken).get(USER_ID);
    }

    private final static String base64Secret = "MDk4ZjZiY2Q0NjIxZDM3M2NhZGU0ZTgzMjYyN2I0ZjY=";
    private final static int expiresSecond = 172800000;
    public final static String USER_ID = "id";

    public final static String tokenHeader = "Authorization";

    public static Claims parseJWT(String jsonWebToken) {
        Claims claims = Jwts.parser()
                .setSigningKey(DatatypeConverter.parseBase64Binary(base64Secret))
                .parseClaimsJws(jsonWebToken).getBody();
        return claims;
    }

    public static String createJWT(Serializable id) {
        SignatureAlgorithm signatureAlgorithm = SignatureAlgorithm.HS256;

        long nowMillis = System.currentTimeMillis();
        Date now = new Date(nowMillis);

        //生成签名密钥
        byte[] apiKeySecretBytes = DatatypeConverter.parseBase64Binary(base64Secret);
        Key signingKey = new SecretKeySpec(apiKeySecretBytes, signatureAlgorithm.getJcaName());

        //添加构成JWT的参数
        JwtBuilder builder = Jwts.builder().setHeaderParam("typ", "JWT")
                .claim(USER_ID, id)
                .signWith(signatureAlgorithm, signingKey);
        //添加Token过期时间
        if (expiresSecond >= 0) {
            long expMillis = nowMillis + expiresSecond;
            Date exp = new Date(expMillis);
            builder.setExpiration(exp).setNotBefore(now);
        }

        //生成JWT
        return builder.compact();
    }

    public static void main(String[] args) {
//        String jwt = createJWT("555","666");
        Claims claims = parseJWT("eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX25hbWUiOiJhZG1pbiIsInVzZXJfcm9sZSI6IltST0xFX0FETUlOXSIsImV4cCI6MTUyNjk5NzEyMywibmJmIjoxNTI2ODI0MzIzfQ.6Lu3Cgw1-bmtQM7VPuY4W8nL-hFCRjcmmVkxkqwj_hs");
        System.out.println(claims.get(USER_ID));
    }
}
