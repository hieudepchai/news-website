/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package nw.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 *
 * @author quan1
 */
public class encodeURL {
    public static String urlEncode(String value, String charset) throws UnsupportedEncodingException {
        return URLEncoder.encode(value, charset);
    }
}
