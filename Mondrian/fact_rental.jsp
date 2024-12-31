<%@ page session="true" contentType="text/html; charset=ISO-8859-1" %>
<%@ taglib uri="http://www.tonbeller.com/jpivot" prefix="jp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>

<jp:mondrianQuery id="query01" jdbcDriver="com.mysql.jdbc.Driver" 
jdbcUrl="jdbc:mysql://localhost/dwh?user=root&password" 
catalogUri="/WEB-INF/queries/fact_rental.xml">

select 
  {[Measures].[Total Amount], [Measures].[Rental Count]} ON COLUMNS,
  CrossJoin(
    {[Staff].[All Staff]},
    CrossJoin(
      {[Customer Segmentations].[All Country]},
      {[Film Rating].[All Rating]}
    )
  ) ON ROWS
from [Rental]

</jp:mondrianQuery>

<c:set var="title01" scope="session">Query SALES using Mondrian OLAP</c:set>
