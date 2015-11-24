package com.lubocluod.touchwebcms.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lubocluod.touchwebcms.dao.DataConnection;
import com.lubocluod.touchwebcms.dao.HotspotDao;
import com.lubocluod.touchwebcms.entity.Hotspot;

public class HotspotDaoImpl implements HotspotDao {

    private Connection conn;
    private PreparedStatement stat = null;

    public HotspotDaoImpl() {
        try {
            this.conn = DataConnection.getConnection();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public int add(Hotspot hot) {
        // TODO Auto-generated method stub
        String sql = "INSERT INTO hotspot(cat_id,title,image,url,type,create_time,dead_time,idx) VALUES(?,?,?,?,?,?,?,?)";
        try {
            int i=1;
            stat = conn.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);
            stat.setInt(i++, hot.getCatId());
            stat.setString(i++, hot.getTitle());
            stat.setString(i++, hot.getImageuri());
            stat.setString(i++, hot.getUrl());
            stat.setInt(i++, hot.getType());
            stat.setTimestamp(i++, hot.getCreatetime());
            stat.setTimestamp(i++, hot.getDeadtime());
            stat.setInt(i++, hot.getIndex());
            stat.executeUpdate();
            ResultSet rs = stat.getGeneratedKeys();
            if (rs.next()) {
                return rs.getInt(1);
            } else {
                return -1;
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return 0;
    }

    @Override
    public boolean delete(int id) {
        // TODO Auto-generated method stub
        String sql = "DELETE FROM hotspot where id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean update(Hotspot hot) {
        // TODO Auto-generated method stub
        String sql = "UPDATE hotspot SET cat_id=?,title=?,image=?,url=?,type=?,status=?,create_time=?,dead_time=?,idx=? WHERE id=?";
        try {
            int i=1;
            stat = conn.prepareStatement(sql);
            stat.setInt(i++, hot.getCatId());
            stat.setString(i++, hot.getTitle());
            stat.setString(i++, hot.getImageuri());
            stat.setString(i++, hot.getUrl());
            stat.setInt(i++, hot.getType());
            stat.setInt(i++, hot.getStatus());
            stat.setTimestamp(i++, hot.getCreatetime());
            stat.setTimestamp(i++, hot.getDeadtime());
            stat.setInt(i++, hot.getIndex());
            stat.setInt(i++, hot.getId());
            stat.executeUpdate();
            return true;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Hotspot find(int id) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,cat_id,title,image,url,type,status,create_time,dead_time,idx FROM hotspot WHERE id=?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, id);
            ResultSet rs = stat.executeQuery();
            Hotspot hot = null;
            if (rs.next()) {
                hot = new Hotspot();
                hot.setId(rs.getInt("id"));
                hot.setCatId(rs.getInt("cat_id"));
                hot.setTitle(rs.getString("title"));
                hot.setImageuri(rs.getString("image"));
                hot.setUrl(rs.getString("url"));
                hot.setType(rs.getInt("type"));
                hot.setStatus(rs.getInt("status"));
                hot.setCreatetime(rs.getTimestamp("create_time"));
                hot.setDeadtime(rs.getTimestamp("dead_time"));
                hot.setIndex(rs.getInt("idx"));
            }
            return hot;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Hotspot> findAll() {
        // TODO Auto-generated method stub
        String sql = "SELECT id,cat_id,title,image,url,type,status,create_time,dead_time,idx FROM hotspot";
        try {
            stat = conn.prepareStatement(sql);
            ResultSet rs = stat.executeQuery();
            List<Hotspot> list = new ArrayList<Hotspot>();
            Hotspot hot = null;
            while (rs.next()) {
                hot = new Hotspot();
                hot.setId(rs.getInt("id"));
                hot.setCatId(rs.getInt("cat_id"));
                hot.setTitle(rs.getString("title"));
                hot.setImageuri(rs.getString("image"));
                hot.setUrl(rs.getString("url"));
                hot.setType(rs.getInt("type"));
                hot.setStatus(rs.getInt("status"));
                hot.setCreatetime(rs.getTimestamp("create_time"));
                hot.setDeadtime(rs.getTimestamp("dead_time"));
                hot.setIndex(rs.getInt("idx"));
                list.add(hot);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Hotspot> findImageHotspot(int cnt, int catId) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,cat_id,title,image,url,type,status,create_time,dead_time,idx FROM hotspot WHERE (cat_id=? OR cat_id IN(select cat_id FROM coursecategory WHERE parent_id=?)) AND type=1 ORDER BY idx,create_time LIMIT ?";
        try {
            int i=1;
            stat = conn.prepareStatement(sql);
            stat.setInt(i++, catId);
            stat.setInt(i++, catId);
            stat.setInt(i++, cnt);
            ResultSet rs = stat.executeQuery();
            List<Hotspot> list = new ArrayList<Hotspot>();
            Hotspot hot = null;
            while (rs.next()) {
                hot = new Hotspot();
                hot.setId(rs.getInt("id"));
                hot.setCatId(rs.getInt("cat_id"));
                hot.setTitle(rs.getString("title"));
                hot.setImageuri(rs.getString("image"));
                hot.setUrl(rs.getString("url"));
                hot.setType(rs.getInt("type"));
                hot.setStatus(rs.getInt("status"));
                hot.setCreatetime(rs.getTimestamp("create_time"));
                hot.setDeadtime(rs.getTimestamp("dead_time"));
                hot.setIndex(rs.getInt("idx"));
                list.add(hot);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

    @Override
    public List<Hotspot> findTextHotspot(int cnt, int catId) {
        // TODO Auto-generated method stub
        String sql = "SELECT id,cat_id,title,image,url,type,status,create_time,dead_time,idx FROM hotspot WHERE (cat_id=? OR cat_id IN(select cat_id FROM coursecategory WHERE parent_id=?)) AND type=0 ORDER BY idx,create_time LIMIT ?";
        try {
            stat = conn.prepareStatement(sql);
            stat.setInt(1, catId);
            stat.setInt(2, catId);
            stat.setInt(3, cnt);
            ResultSet rs = stat.executeQuery();
            List<Hotspot> list = new ArrayList<Hotspot>();
            Hotspot hot = null;
            while (rs.next()) {
                hot = new Hotspot();
                hot.setId(rs.getInt("id"));
                hot.setCatId(rs.getInt("cat_id"));
                hot.setTitle(rs.getString("title"));
                hot.setImageuri(rs.getString("image"));
                hot.setUrl(rs.getString("url"));
                hot.setType(rs.getInt("type"));
                hot.setStatus(rs.getInt("status"));
                hot.setCreatetime(rs.getTimestamp("create_time"));
                hot.setDeadtime(rs.getTimestamp("dead_time"));
                hot.setIndex(rs.getInt("idx"));
                list.add(hot);
            }
            return list;
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }

}
