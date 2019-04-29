package com.nocompany.tools.codegen.config;

import com.alibaba.druid.pool.DruidDataSource;
import com.nocompany.tools.codegen.initialize.TableInitializer;
import com.nocompany.tools.codegen.initialize.mysql.MysqlTableInitializer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.JdbcTemplate;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = {
        "com.nocompany.tools.codegen"
})
@PropertySource(value = "application.properties")
public class CodeGenConfiguration {

    @Bean
    public TableInitializer tableInitializer() {
        return new MysqlTableInitializer();
    }

    @Autowired
    Environment env;
    public void setEnv(Environment env) {
        this.env = env;
    }

    @Bean
    public DataSource dataSource() {
        DruidDataSource dataSource = new DruidDataSource();
        dataSource.setUrl(env.getProperty("spring.datasource.url"));
        dataSource.setUsername(env.getProperty("spring.datasource.username"));// 用户名
        dataSource.setPassword(env.getProperty("spring.datasource.password"));// 密码
        return dataSource;
    }

    @Bean
    public JdbcTemplate jdbcTemplate() {
        return new JdbcTemplate(dataSource());
    }
}
