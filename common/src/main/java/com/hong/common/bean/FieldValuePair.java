package com.hong.common.bean;

import lombok.Data;
import lombok.experimental.Accessors;

@Data
@Accessors(chain = true)
public class FieldValuePair {
    private String field;
    private Object value;
}
