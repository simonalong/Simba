package com.isyscore.robot.core.xml.element;

import com.isyscore.robot.core.xml.validate.AbstractElementValidator;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author shizi
 * @since 2020/4/22 7:00 PM
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ActivationElement extends AbstractElementValidator {

    private String activeByDefault;
    private String jdk;
    private String os;
    private String property;
    private String file;
}
