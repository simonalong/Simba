<?xml version="1.0" encoding="UTF-8" ?>
<configuration scan="true" scanPeriod="60000" debug="true">

    <include resource="org/springframework/boot/logging/logback/base.xml"/>

    <!--这里配置下，方便知道有多少变量-->
    <property name="LOG_HOME" value="${r'${LOG_HOME}'}"/>
    <property name="APP_NAME" value="${r'${APP_NAME}'}"/>
    <property name="LOG_LEVEL" value="${r'${LOG_LEVEL}'}"/>

    <!--格式化输出：%d表示日期，%thread表示线程名，%-5level：级别从左显示5个字符宽度，%logger: 日志输出者的名字, %msg：日志消息，%n是换行符 -->
    <property name="pattern" value="%d{yyyy-MM-dd HH:mm:ss.SSS} [ %thread ] - [ %-5level ] [ %logger{50} : %line ] - %msg%n"/>
    <contextName>${r'${APP_NAME}'}</contextName>

    <!--记录warn和Error级别-->
    <appender name="RollingWarnOrErrorLogger" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${r'${LOG_HOME}'}/${r'${APP_NAME}'}/warn.log</file>
        <rollingPolicy class="ch.qos.logback.core.rolling.TimeBasedRollingPolicy">
            <fileNamePattern>${r'${LOG_HOME}'}/${r'${APP_NAME}'}/warnOrError.log.%d{yyyy-MM-dd}</fileNamePattern>
            <maxHistory>60</maxHistory>
        </rollingPolicy>
        <filter class="ch.qos.logback.classic.filter.ThresholdFilter">
            <level>WARN</level>
        </filter>
        <encoder>
            <pattern>${r'${pattern}'}</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>

    <!--记录info级别-->
    <appender name="RollingInfoLogger" class="ch.qos.logback.core.rolling.RollingFileAppender">
        <file>${r'${LOG_HOME}'}/${r'${APP_NAME}'}/info.log</file>
        <!--文件可能多，按照日期和尺寸配置-->
        <rollingPolicy class="ch.qos.logback.core.rolling.SizeAndTimeBasedRollingPolicy">
            <fileNamePattern>${r'${LOG_HOME}'}/${r'${APP_NAME}'}/info.%i.log.%d{yyyy-MM-dd}</fileNamePattern>
            <!-- 每个文件最大100M，保存60天，但是最大20G -->
            <maxFileSize>100MB</maxFileSize>
            <maxHistory>60</maxHistory>
            <totalSizeCap>20GB</totalSizeCap>
        </rollingPolicy>
        <filter class="ch.qos.logback.classic.filter.LevelFilter">
            <level>INFO</level>
            <onMatch>ACCEPT</onMatch>
            <onMismatch>DENY</onMismatch>
        </filter>
        <encoder>
            <pattern>${r'${pattern}'}</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>

    <!-- 控制台输出 -->
    <appender name="STDOUT" class="ch.qos.logback.core.ConsoleAppender">
        <encoder>
            <pattern>${r'${pattern}'}</pattern>
            <charset>UTF-8</charset>
        </encoder>
    </appender>

    <logger name="org.springframework" level="info" additivity="false"/>

    <logger name="com.isyscore.ibo.neo" level="${r'${LOG_LEVEL}'}" additivity="false">
        <appender-ref ref="RollingInfoLogger"/>
        <appender-ref ref="RollingWarnOrErrorLogger"/>
    </logger>

    <root level="${r'${LOG_LEVEL}'}">
        <appender-ref ref="STDOUT"/>
        <appender-ref ref="RollingWarnOrErrorLogger"/>
        <appender-ref ref="RollingInfoLogger"/>
    </root>

</configuration>
