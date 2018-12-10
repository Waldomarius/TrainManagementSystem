package com.trainmanagement.datasource;

import javax.naming.NamingException;
import javax.sql.DataSource;

public interface DataSourceInterface {

    DataSource dataSource() throws NamingException;

}
