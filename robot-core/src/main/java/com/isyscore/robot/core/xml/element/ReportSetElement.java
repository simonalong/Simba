package com.isyscore.robot.core.xml.element;

import com.isyscore.robot.core.xml.validate.AbstractElementValidator;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author shizi
 * @since 2020/4/22 7:28 PM
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ReportSetElement extends AbstractElementValidator {

    private String id;
    private String configuration;
    private String inherited;
    private String reports;
}
