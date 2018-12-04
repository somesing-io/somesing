package com.somesing.config;

import org.apache.commons.dbcp.BasicDataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

@Configuration
@MapperScan(basePackages={"com.somesing.www.*.dao"}) 
/* MyBatis와 연동되는 dao 파일을 패키지 기반으로 스캔 */
public class DbConfig {

	@Value("${spring.datasource.driver-class-name}")
    private String jdbcDriverClassName;
 
    @Value("${spring.datasource.url}")
    private String jdbcUrl;
 
    @Value("${spring.datasource.username}")
    private String jdbcUsername;
 
    @Value("${spring.datasource.password}")
    private String jdbcPassword;
    
    private String mapperLocation = "classpath:mybatis/mapper/**/*.xml";
    private String configLocation = "classpath:mybatis/config/mybatisConfig.xml";
    
    /**
     * DB 관련 설정
     * **/
    @Bean
    public BasicDataSource dataSource() {
    	BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName(this.jdbcDriverClassName);
        dataSource.setUrl(this.jdbcUrl);
        dataSource.setUsername(this.jdbcUsername);
        dataSource.setPassword(this.jdbcPassword);
        dataSource.setMaxActive(20);
        dataSource.setMaxIdle(2);
        dataSource.setMaxWait(5000);
        dataSource.setTestOnBorrow(true);
        dataSource.setValidationQuery("select 1 from dual");
        dataSource.setTestWhileIdle(true);
        dataSource.setTimeBetweenEvictionRunsMillis(600000);
        return dataSource;
    }
    
    /**
     * 트랜젝션 관련 설정
     * **/
    @Bean
    public DataSourceTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource());
    }
    
    /**
     * Spring & Mybatis 연결 관련 설정
     * **/
    @Bean
    public SqlSessionFactoryBean sqlSessionFactoryBean() throws Exception{
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource());
        sessionFactory.setMapperLocations(new PathMatchingResourcePatternResolver().getResources(mapperLocation));
        sessionFactory.setConfigLocation(new PathMatchingResourcePatternResolver().getResource(configLocation));
        return sessionFactory;
    }
}
