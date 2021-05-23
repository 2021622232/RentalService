package dao.impl;

import dao.CDCDao;
import domain.CDC;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import utils.JDBCUtils;

import java.util.List;

public class CDCDaoImpl implements CDCDao {
    private JdbcTemplate template = new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<CDC> findAllCollege() {
        try {
            String sql = "select distinct time from schedule";
            List<CDC> cdcs = template.query(sql, new BeanPropertyRowMapper<CDC>(CDC.class));
            return cdcs;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<CDC> findAllDepartment() {
        try {
            String sql = "select distinct department from schedule";
            List<CDC> cdcs = template.query(sql, new BeanPropertyRowMapper<CDC>(CDC.class));
            return cdcs;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<CDC> findAllClass() {
        try {
            String sql = "select distinct cclass from schedule";
            List<CDC> cdcs = template.query(sql, new BeanPropertyRowMapper<CDC>(CDC.class));
            return cdcs;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public List<CDC> findAll() {
        try {
            String sql = "select * from schedule";
            List<CDC> cdcs = template.query(sql, new BeanPropertyRowMapper<CDC>(CDC.class));
            return cdcs;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void addCDCAllInfo(CDC updateTeacher) {
        try {
            String sql = "insert into schedule(time) values(?)";
            template.update(sql, updateTeacher.getCollege());
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void deleteCDCById(String teacherid) {
        try {
            String sql = "delete from schedule where time=?";
            template.update(sql,teacherid);
        } catch (DataAccessException e) {
            e.printStackTrace();
        }
    }
}
