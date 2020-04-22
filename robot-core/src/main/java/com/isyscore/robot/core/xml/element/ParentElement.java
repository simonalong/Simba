package com.isyscore.robot.core.xml.element;

import com.isyscore.robot.core.xml.validate.AbstractElementValidator;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * @author shizi
 * @since 2020/4/22 6:35 PM
 */
@Data
@EqualsAndHashCode(callSuper = true)
public class ParentElement extends AbstractElementValidator {

    private String artifactId;
    private String groupId;
    private String version;
    private String relativePath;
}
