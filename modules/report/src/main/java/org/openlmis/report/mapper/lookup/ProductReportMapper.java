package org.openlmis.report.mapper.lookup;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.openlmis.report.model.dto.Product;
import org.openlmis.report.model.dto.ProductList;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * e-lmis
 * Created by: Elias Muluneh
 * Date: 4/12/13
 * Time: 2:39 AM
 */
@Repository
public interface ProductReportMapper {

    @Select("SELECT id, genericname as name, code, " +
            "CASE WHEN tracer = true THEN 'Indicator Product' ELSE 'Regular' END tracer" +
            " " +
            "   FROM " +
            "       products order by tracer,name")
    List<Product> getAll();

    @Select("SELECT * " +
            "   FROM " +
            "       products")
    List<Product> getFullProductList();

    @Select("SELECT id, genericname as name, code, " +
            "CASE WHEN tracer = true THEN 'Indicator Product' ELSE 'Regular' END tracer  " +
            "FROM products " +
            "WHERE categoryid = #{categoryId} " +
            "order by tracer,name")
    List<Product> getProductListByCategory(@Param("categoryId") Integer categoryId);




}
